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
-- BIN_OP_EQ[uxn_opcodes_h_l614_c6_7599]
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l614_c2_9446]
signal t8_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l614_c2_9446]
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l627_c11_e103]
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l627_c7_f18f]
signal t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l627_c7_f18f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l627_c7_f18f]
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l627_c7_f18f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l627_c7_f18f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l627_c7_f18f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l630_c11_dc10]
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l630_c7_38fc]
signal t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l630_c7_38fc]
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_38fc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_38fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_38fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l632_c30_2b18]
signal sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_bc73]
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599
BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left,
BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right,
BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output);

-- t8_MUX_uxn_opcodes_h_l614_c2_9446
t8_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l614_c2_9446_cond,
t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446
result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103
BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right,
BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output);

-- t8_MUX_uxn_opcodes_h_l627_c7_f18f
t8_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f
result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10
BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output);

-- t8_MUX_uxn_opcodes_h_l630_c7_38fc
t8_MUX_uxn_opcodes_h_l630_c7_38fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond,
t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue,
t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse,
t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc
result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l632_c30_2b18
sp_relative_shift_uxn_opcodes_h_l632_c30_2b18 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins,
sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x,
sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y,
sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output,
 t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output,
 t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output,
 t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output,
 sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f31f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_efb3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_b6cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_f18f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l634_c3_c9fc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_6a1f_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_05fb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_604d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_0bf1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l638_l610_DUPLICATE_6138_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f31f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l619_c3_f31f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_efb3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_efb3;
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_b6cb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l628_c3_b6cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l631_c8_6a1f] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_6a1f_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l614_c6_7599] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_left;
     BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output := BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_0bf1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_0bf1_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_604d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_604d_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_05fb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_05fb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l630_c11_dc10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_left;
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output := BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_9446_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_f18f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l627_c11_e103] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_left;
     BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output := BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l632_c30_2b18] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_ins;
     sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_x;
     sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output := sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c6_7599_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l627_c11_e103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_dc10_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_6a1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l631_c8_6a1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_05fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_05fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l630_l614_l627_DUPLICATE_2627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_0bf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_0bf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_604d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l630_l627_DUPLICATE_604d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l614_c2_9446_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l614_c2_9446_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l627_c7_f18f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_2b18_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_38fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;

     -- t8_MUX[uxn_opcodes_h_l630_c7_38fc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_cond;
     t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue;
     t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output := t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_38fc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_38fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_bc73] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_left;
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output := BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l634_c3_c9fc := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_bc73_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue := VAR_result_u16_value_uxn_opcodes_h_l634_c3_c9fc;
     -- t8_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l630_c7_38fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_38fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_t8_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l627_c7_f18f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output := result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;

     -- t8_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output := t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l627_c7_f18f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l614_c2_9446_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l614_c2_9446] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_cond;
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output := result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l638_l610_DUPLICATE_6138 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l638_l610_DUPLICATE_6138_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c2_9446_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c2_9446_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l638_l610_DUPLICATE_6138_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l638_l610_DUPLICATE_6138_return_output;
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
