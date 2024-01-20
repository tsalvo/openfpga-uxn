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
-- BIN_OP_EQ[uxn_opcodes_h_l658_c6_5d5d]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c2_711a]
signal n8_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_711a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l658_c2_711a]
signal t8_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l671_c11_14df]
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l671_c7_2623]
signal n8_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l671_c7_2623]
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_2623]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_2623]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_2623]
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_2623]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l671_c7_2623]
signal t8_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_5099]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l674_c7_ed9e]
signal t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_142c]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_ccfc]
signal n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_ccfc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_ccfc]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_ccfc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_ccfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l679_c30_d31c]
signal sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c22_b4e2]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_a521]
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l681_c22_78a8]
signal MUX_uxn_opcodes_h_l681_c22_78a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_78a8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_78a8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_78a8_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d
BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c2_711a
n8_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c2_711a_cond,
n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a
result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- t8_MUX_uxn_opcodes_h_l658_c2_711a
t8_MUX_uxn_opcodes_h_l658_c2_711a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l658_c2_711a_cond,
t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue,
t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse,
t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df
BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output);

-- n8_MUX_uxn_opcodes_h_l671_c7_2623
n8_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l671_c7_2623_cond,
n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623
result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- t8_MUX_uxn_opcodes_h_l671_c7_2623
t8_MUX_uxn_opcodes_h_l671_c7_2623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l671_c7_2623_cond,
t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue,
t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse,
t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099
BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output);

-- n8_MUX_uxn_opcodes_h_l674_c7_ed9e
n8_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e
result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- t8_MUX_uxn_opcodes_h_l674_c7_ed9e
t8_MUX_uxn_opcodes_h_l674_c7_ed9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond,
t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue,
t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse,
t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c
BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_ccfc
n8_MUX_uxn_opcodes_h_l677_c7_ccfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond,
n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l679_c30_d31c
sp_relative_shift_uxn_opcodes_h_l679_c30_d31c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins,
sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x,
sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y,
sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2
BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output);

-- MUX_uxn_opcodes_h_l681_c22_78a8
MUX_uxn_opcodes_h_l681_c22_78a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l681_c22_78a8_cond,
MUX_uxn_opcodes_h_l681_c22_78a8_iftrue,
MUX_uxn_opcodes_h_l681_c22_78a8_iffalse,
MUX_uxn_opcodes_h_l681_c22_78a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output,
 n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output,
 n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output,
 n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output,
 sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output,
 MUX_uxn_opcodes_h_l681_c22_78a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_6102 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_d0ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d4f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_2623_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_78a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_3136_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_78a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l685_l654_DUPLICATE_e42d_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_6102 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_6102;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_d0ba := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_d0ba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d4f3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d4f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c22_b4e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_2623_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l671_c11_14df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_left;
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output := BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_711a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l658_c6_5d5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_142c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_5099] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l681_c42_3136] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_3136_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l679_c30_d31c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_ins;
     sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_x;
     sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output := sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_5d5d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_14df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_5099_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_142c_return_output;
     VAR_MUX_uxn_opcodes_h_l681_c22_78a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_b4e2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_3136_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_1a73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l677_l671_l674_l658_DUPLICATE_a0ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_48d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l677_l671_l674_DUPLICATE_7e35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_711a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_711a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_d31c_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_ccfc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output := n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_ccfc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_a521] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_left;
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output := BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_ccfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_ccfc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- t8_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_a521_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_t8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- MUX[uxn_opcodes_h_l681_c22_78a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l681_c22_78a8_cond <= VAR_MUX_uxn_opcodes_h_l681_c22_78a8_cond;
     MUX_uxn_opcodes_h_l681_c22_78a8_iftrue <= VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iftrue;
     MUX_uxn_opcodes_h_l681_c22_78a8_iffalse <= VAR_MUX_uxn_opcodes_h_l681_c22_78a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l681_c22_78a8_return_output := MUX_uxn_opcodes_h_l681_c22_78a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output := t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue := VAR_MUX_uxn_opcodes_h_l681_c22_78a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_n8_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     -- t8_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output := t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- n8_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output := n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_ccfc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ccfc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l658_c2_711a_return_output;
     -- n8_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output := n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l674_c7_ed9e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output := result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l658_c2_711a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_ed9e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l671_c7_2623] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_cond;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output := result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_2623_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l658_c2_711a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l685_l654_DUPLICATE_e42d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l685_l654_DUPLICATE_e42d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_711a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_711a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l685_l654_DUPLICATE_e42d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l685_l654_DUPLICATE_e42d_return_output;
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
