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
-- Submodules: 28
entity jmp_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_121b1df5;
architecture arch of jmp_0CLK_121b1df5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l592_c6_f979]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c2_a5df]
signal t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c2_a5df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l605_c11_cf6f]
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l605_c7_3285]
signal t8_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l605_c7_3285]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l605_c7_3285]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l605_c7_3285]
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l605_c7_3285]
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l605_c7_3285]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l608_c11_7044]
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l608_c7_193f]
signal t8_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l608_c7_193f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l608_c7_193f]
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l608_c7_193f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l608_c7_193f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l610_c30_0cf4]
signal sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l612_c22_2887]
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a57( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979
BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c2_a5df
t8_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df
result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f
BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output);

-- t8_MUX_uxn_opcodes_h_l605_c7_3285
t8_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l605_c7_3285_cond,
t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285
result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044
BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output);

-- t8_MUX_uxn_opcodes_h_l608_c7_193f
t8_MUX_uxn_opcodes_h_l608_c7_193f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l608_c7_193f_cond,
t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue,
t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse,
t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f
result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4
sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins,
sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x,
sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y,
sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left,
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right,
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output,
 t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output,
 t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output,
 t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output,
 sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_71f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_e4b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_658f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_3285_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l612_c3_297c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_a36c_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_a275_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_c597_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_2baf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l588_l616_DUPLICATE_38de_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_71f3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_71f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_658f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_658f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_e4b6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_e4b6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l609_c8_a36c] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_a36c_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_a5df_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_2baf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_2baf_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_a275 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_a275_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l605_c11_cf6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l610_c30_0cf4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_ins;
     sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_x;
     sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output := sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_c597 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_c597_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_3285_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l608_c11_7044] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_left;
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output := BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c6_f979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_f979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_cf6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_7044_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_a36c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_a36c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_c597_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_c597_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l605_l608_l592_DUPLICATE_df7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_2baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_2baf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_a275_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l605_l608_DUPLICATE_a275_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_a5df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_a5df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_3285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_0cf4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l608_c7_193f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output;

     -- t8_MUX[uxn_opcodes_h_l608_c7_193f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l608_c7_193f_cond <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_cond;
     t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iftrue;
     t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output := t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l608_c7_193f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l612_c22_2887] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_left;
     BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output := BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l608_c7_193f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l612_c3_297c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_2887_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_193f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_193f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_193f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_t8_MUX_uxn_opcodes_h_l608_c7_193f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l612_c3_297c;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- t8_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output := t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l608_c7_193f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output := result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_193f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_t8_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l605_c7_3285] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_cond;
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output := result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- t8_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_3285_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l592_c2_a5df] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l588_l616_DUPLICATE_38de LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l588_l616_DUPLICATE_38de_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a57(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_a5df_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_a5df_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l588_l616_DUPLICATE_38de_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l588_l616_DUPLICATE_38de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
