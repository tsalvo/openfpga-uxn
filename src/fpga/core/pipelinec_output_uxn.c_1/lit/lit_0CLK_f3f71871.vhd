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
-- Submodules: 27
entity lit_0CLK_f3f71871 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_f3f71871;
architecture arch of lit_0CLK_f3f71871 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l185_c6_d56a]
signal BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l185_c2_46de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_13f6]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_19d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l201_c22_91dd]
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l203_c11_8f6d]
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l203_c7_66cb]
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_66cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_66cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_66cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_66cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a
BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left,
BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right,
BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de
result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de
result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de
result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de
result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de
result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de
result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de
result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de
result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6
BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2
result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2
result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left,
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right,
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d
BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb
result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_a52b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_0a18 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l198_c7_19d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l201_c3_1e26 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_19d2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_4d73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_c7_66cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_c629_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_d098_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l211_l181_DUPLICATE_3b95_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_4d73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_4d73;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_0a18 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_0a18;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_a52b := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_a52b;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue := VAR_previous_ram_read;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_c7_66cb_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l201_c22_91dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l203_c11_8f6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l185_c2_46de_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output := result.is_vram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l198_c7_19d2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l185_c6_d56a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_left;
     BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output := BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_d098 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_d098_return_output := result.is_stack_write;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_19d2_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_c629 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_c629_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_13f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l185_c6_d56a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_13f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_8f6d_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l201_c3_1e26 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_91dd_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_c629_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_c629_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_d098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l203_DUPLICATE_d098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_f119_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l185_DUPLICATE_3a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_c7_66cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l185_c2_46de_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l185_c2_46de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l201_c3_1e26;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_66cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_66cb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l198_c7_19d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_19d2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l185_c2_46de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l211_l181_DUPLICATE_3b95 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l211_l181_DUPLICATE_3b95_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l185_c2_46de_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l211_l181_DUPLICATE_3b95_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l211_l181_DUPLICATE_3b95_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
