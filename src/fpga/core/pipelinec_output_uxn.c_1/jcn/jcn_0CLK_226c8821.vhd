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
-- BIN_OP_EQ[uxn_opcodes_h_l658_c6_2f53]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_a23d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c2_a23d]
signal n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l658_c2_a23d]
signal t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l671_c11_63cb]
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_5044]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_5044]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l671_c7_5044]
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_5044]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_5044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l671_c7_5044]
signal n8_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l671_c7_5044]
signal t8_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_3347]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_b982]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l674_c7_b982]
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_b982]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_b982]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l674_c7_b982]
signal n8_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l674_c7_b982]
signal t8_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_bb2e]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_7bb9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_7bb9]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_7bb9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_7bb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_7bb9]
signal n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l679_c30_f486]
signal sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c22_98b5]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_cf9f]
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l681_c22_d49e]
signal MUX_uxn_opcodes_h_l681_c22_d49e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_d49e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_d49e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_d49e_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53
BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d
result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c2_a23d
n8_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- t8_MUX_uxn_opcodes_h_l658_c2_a23d
t8_MUX_uxn_opcodes_h_l658_c2_a23d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond,
t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue,
t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse,
t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb
BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044
result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- n8_MUX_uxn_opcodes_h_l671_c7_5044
n8_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l671_c7_5044_cond,
n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- t8_MUX_uxn_opcodes_h_l671_c7_5044
t8_MUX_uxn_opcodes_h_l671_c7_5044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l671_c7_5044_cond,
t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue,
t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse,
t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347
BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982
result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- n8_MUX_uxn_opcodes_h_l674_c7_b982
n8_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l674_c7_b982_cond,
n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- t8_MUX_uxn_opcodes_h_l674_c7_b982
t8_MUX_uxn_opcodes_h_l674_c7_b982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l674_c7_b982_cond,
t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue,
t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse,
t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e
BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9
result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_7bb9
n8_MUX_uxn_opcodes_h_l677_c7_7bb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond,
n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l679_c30_f486
sp_relative_shift_uxn_opcodes_h_l679_c30_f486 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins,
sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x,
sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y,
sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5
BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output);

-- MUX_uxn_opcodes_h_l681_c22_d49e
MUX_uxn_opcodes_h_l681_c22_d49e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l681_c22_d49e_cond,
MUX_uxn_opcodes_h_l681_c22_d49e_iftrue,
MUX_uxn_opcodes_h_l681_c22_d49e_iffalse,
MUX_uxn_opcodes_h_l681_c22_d49e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output,
 sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output,
 MUX_uxn_opcodes_h_l681_c22_d49e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_2407 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_d3af : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_edd9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_5044_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_d49e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_457b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_d49e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l654_l685_DUPLICATE_3c59_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_d3af := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_d3af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_2407 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_2407;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_edd9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_edd9;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l658_c6_2f53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_3347] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_bb2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_5044_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l681_c42_457b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_457b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l671_c11_63cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l679_c30_f486] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_ins;
     sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_x;
     sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output := sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c22_98b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_a23d_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_2f53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_63cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_3347_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_bb2e_return_output;
     VAR_MUX_uxn_opcodes_h_l681_c22_d49e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_98b5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_457b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_b4f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l671_l674_l658_l677_DUPLICATE_85e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_8cd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l671_l674_l677_DUPLICATE_3d51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_a23d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_a23d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_f486_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_7bb9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;

     -- t8_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output := t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_7bb9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output := n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_7bb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_cf9f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_7bb9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_cf9f_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_t8_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     -- n8_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output := n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- MUX[uxn_opcodes_h_l681_c22_d49e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l681_c22_d49e_cond <= VAR_MUX_uxn_opcodes_h_l681_c22_d49e_cond;
     MUX_uxn_opcodes_h_l681_c22_d49e_iftrue <= VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iftrue;
     MUX_uxn_opcodes_h_l681_c22_d49e_iffalse <= VAR_MUX_uxn_opcodes_h_l681_c22_d49e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l681_c22_d49e_return_output := MUX_uxn_opcodes_h_l681_c22_d49e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- t8_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output := t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue := VAR_MUX_uxn_opcodes_h_l681_c22_d49e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_n8_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- n8_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output := n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_7bb9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- t8_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_7bb9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l674_c7_b982] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_cond;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output := result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- n8_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_b982_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l671_c7_5044] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_cond;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output := result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_5044_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l658_c2_a23d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l654_l685_DUPLICATE_3c59 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l654_l685_DUPLICATE_3c59_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_a23d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l654_l685_DUPLICATE_3c59_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l654_l685_DUPLICATE_3c59_return_output;
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
