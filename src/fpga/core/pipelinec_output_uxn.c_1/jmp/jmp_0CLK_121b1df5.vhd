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
-- BIN_OP_EQ[uxn_opcodes_h_l614_c6_5842]
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l614_c2_8436]
signal t8_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c2_8436]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l627_c11_1063]
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l627_c7_ae67]
signal t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l627_c7_ae67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l627_c7_ae67]
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l627_c7_ae67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l627_c7_ae67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l627_c7_ae67]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l630_c11_8d8b]
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l630_c7_3ffa]
signal t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_3ffa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_3ffa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_3ffa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l630_c7_3ffa]
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l632_c30_35ae]
signal sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_ae41]
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842
BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left,
BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right,
BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output);

-- t8_MUX_uxn_opcodes_h_l614_c2_8436
t8_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l614_c2_8436_cond,
t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436
result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063
BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output);

-- t8_MUX_uxn_opcodes_h_l627_c7_ae67
t8_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67
result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b
BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output);

-- t8_MUX_uxn_opcodes_h_l630_c7_3ffa
t8_MUX_uxn_opcodes_h_l630_c7_3ffa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond,
t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue,
t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse,
t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa
result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l632_c30_35ae
sp_relative_shift_uxn_opcodes_h_l632_c30_35ae : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins,
sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x,
sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y,
sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output,
 t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output,
 t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output,
 t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output,
 sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f83d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_6af9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_4b81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_ae67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l634_c3_92fa : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_38df_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_d193_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_4d44_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_2535_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l638_l610_DUPLICATE_aba3_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_6af9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_6af9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_4b81 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_4b81;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f83d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f83d;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_d193 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_d193_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_4d44 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_4d44_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l631_c8_38df] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_38df_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l614_c6_5842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_left;
     BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output := BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l630_c11_8d8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l627_c11_1063] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_left;
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output := BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_ae67_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l632_c30_35ae] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_ins;
     sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_x;
     sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output := sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_8436_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_2535 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_2535_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_5842_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_1063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_8d8b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_38df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_38df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_4d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_4d44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_9386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_d193_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_2535_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_2535_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_8436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_8436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_ae67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_35ae_return_output;
     -- t8_MUX[uxn_opcodes_h_l630_c7_3ffa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_cond;
     t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue;
     t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output := t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_3ffa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_ae41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_left;
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output := BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_3ffa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_3ffa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l634_c3_92fa := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ae41_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_t8_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue := VAR_result_u16_value_uxn_opcodes_h_l634_c3_92fa;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- t8_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l630_c7_3ffa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output := result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_3ffa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_t8_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l627_c7_ae67] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_cond;
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output := result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;

     -- t8_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output := t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_ae67_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l614_c2_8436_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l614_c2_8436] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_cond;
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output := result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l638_l610_DUPLICATE_aba3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l638_l610_DUPLICATE_aba3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_763b(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_8436_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_8436_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l638_l610_DUPLICATE_aba3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l638_l610_DUPLICATE_aba3_return_output;
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
