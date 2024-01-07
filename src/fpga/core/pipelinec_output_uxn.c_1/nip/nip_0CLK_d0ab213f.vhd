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
-- BIN_OP_EQ[uxn_opcodes_h_l2141_c6_301d]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2141_c2_d89c]
signal t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_e494]
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2154_c7_bac3]
signal t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2156_c30_8bc3]
signal sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_7446]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2158_c7_000d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_000d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_000d]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_000d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_000d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2158_c7_000d]
signal t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d
BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c
result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- t8_MUX_uxn_opcodes_h_l2141_c2_d89c
t8_MUX_uxn_opcodes_h_l2141_c2_d89c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond,
t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue,
t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse,
t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- t8_MUX_uxn_opcodes_h_l2154_c7_bac3
t8_MUX_uxn_opcodes_h_l2154_c7_bac3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond,
t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue,
t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse,
t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3
sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins,
sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x,
sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y,
sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);

-- t8_MUX_uxn_opcodes_h_l2158_c7_000d
t8_MUX_uxn_opcodes_h_l2158_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond,
t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue,
t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse,
t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output,
 sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output,
 t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_07ab : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_65ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_af2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2160_c3_a4d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2158_c7_000d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_a071 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_c7_000d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_47a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_e4fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2167_l2137_DUPLICATE_4566_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_af2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_af2f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_65ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2151_c3_65ec;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_07ab := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_07ab;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2160_c3_a4d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2160_c3_a4d3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_a071 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_a071;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_7446] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c6_301d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_e494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_left;
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output := BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_47a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_47a7_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2156_c30_8bc3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_ins;
     sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_x;
     sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output := sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_e4fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_e4fd_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2158_c7_000d_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_c7_000d_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c6_301d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_e494_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_7446_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_e4fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_e4fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_47a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2154_l2158_DUPLICATE_47a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2141_l2154_l2158_DUPLICATE_b434_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2141_c2_d89c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2156_c30_8bc3_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_000d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2158_c7_000d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_bac3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2154_c7_bac3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c2_d89c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2167_l2137_DUPLICATE_4566 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2167_l2137_DUPLICATE_4566_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c2_d89c_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2167_l2137_DUPLICATE_4566_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2167_l2137_DUPLICATE_4566_return_output;
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
