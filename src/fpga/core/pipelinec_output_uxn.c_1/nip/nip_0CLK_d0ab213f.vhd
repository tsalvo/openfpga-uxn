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
entity nip_0CLK_d0ab213f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_d0ab213f;
architecture arch of nip_0CLK_d0ab213f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2142_c6_8d82]
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2142_c2_dc62]
signal t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_c706]
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2155_c7_e02b]
signal t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2157_c30_22c8]
signal sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_04cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2159_c7_0f90]
signal t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82
BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left,
BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right,
BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62
result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62
result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- t8_MUX_uxn_opcodes_h_l2142_c2_dc62
t8_MUX_uxn_opcodes_h_l2142_c2_dc62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond,
t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue,
t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse,
t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b
result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- t8_MUX_uxn_opcodes_h_l2155_c7_e02b
t8_MUX_uxn_opcodes_h_l2155_c7_e02b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond,
t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue,
t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse,
t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8
sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins,
sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x,
sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y,
sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);

-- t8_MUX_uxn_opcodes_h_l2159_c7_0f90
t8_MUX_uxn_opcodes_h_l2159_c7_0f90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond,
t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue,
t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse,
t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output,
 t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_8ae0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2147_c3_ba87 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2156_c3_b475 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2161_c3_a771 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2163_c3_4a5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_8e87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_1d38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2138_l2168_DUPLICATE_70b0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2161_c3_a771 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2161_c3_a771;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_8ae0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_8ae0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2156_c3_b475 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2156_c3_b475;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2147_c3_ba87 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2147_c3_ba87;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2163_c3_4a5a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2163_c3_4a5a;
     VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y := resize(to_signed(-1, 2), 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_c706] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_left;
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output := BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_8e87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_8e87_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2157_c30_22c8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_ins;
     sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_x;
     sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output := sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_04cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2142_c6_8d82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_1d38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_1d38_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c6_8d82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_c706_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_04cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_8e87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_8e87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_1d38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2155_l2159_DUPLICATE_1d38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2155_l2159_l2142_DUPLICATE_a17e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2142_c2_dc62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2157_c30_22c8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- t8_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_0f90] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output := result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2159_c7_0f90_return_output;
     -- t8_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_e02b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2155_c7_e02b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- t8_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c2_dc62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2138_l2168_DUPLICATE_70b0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2138_l2168_DUPLICATE_70b0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c2_dc62_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2138_l2168_DUPLICATE_70b0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2138_l2168_DUPLICATE_70b0_return_output;
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
