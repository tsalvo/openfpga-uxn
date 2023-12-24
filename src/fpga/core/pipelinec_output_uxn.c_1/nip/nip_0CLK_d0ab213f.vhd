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
-- BIN_OP_EQ[uxn_opcodes_h_l2158_c6_d5fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2158_c2_2a1f]
signal t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_3be3]
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_d853]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2171_c7_d853]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2171_c7_d853]
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_d853]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_d853]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2171_c7_d853]
signal t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2173_c30_e6fb]
signal sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2175_c11_57f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2175_c7_372c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2175_c7_372c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2175_c7_372c]
signal result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2175_c7_372c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2175_c7_372c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2175_c7_372c]
signal t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa
BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f
result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- t8_MUX_uxn_opcodes_h_l2158_c2_2a1f
t8_MUX_uxn_opcodes_h_l2158_c2_2a1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond,
t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue,
t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse,
t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- t8_MUX_uxn_opcodes_h_l2171_c7_d853
t8_MUX_uxn_opcodes_h_l2171_c7_d853 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond,
t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue,
t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse,
t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb
sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins,
sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x,
sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y,
sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c
result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);

-- t8_MUX_uxn_opcodes_h_l2175_c7_372c
t8_MUX_uxn_opcodes_h_l2175_c7_372c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond,
t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue,
t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse,
t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output,
 sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output,
 t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2163_c3_5f60 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_9f81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2172_c3_3e5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2177_c3_09ae : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2175_c7_372c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ebc9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2175_c7_372c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_a3f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_cf31_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2184_l2154_DUPLICATE_3aa0_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ebc9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_ebc9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2172_c3_3e5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2172_c3_3e5b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2177_c3_09ae := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2177_c3_09ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2163_c3_5f60 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2163_c3_5f60;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_9f81 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_9f81;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := t8;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_cf31 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_cf31_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2175_c11_57f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2175_c7_372c_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c6_d5fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2173_c30_e6fb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_ins;
     sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_x;
     sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output := sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113_return_output := result.u8_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2175_c7_372c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_a3f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_a3f3_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_3be3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c6_d5fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_3be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2175_c11_57f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_a3f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_a3f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_cf31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2171_l2175_DUPLICATE_cf31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2171_l2175_l2158_DUPLICATE_5113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2158_c2_2a1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2173_c30_e6fb_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2175_c7_372c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2175_c7_372c_return_output;
     -- t8_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2171_c7_d853] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2171_c7_d853_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2158_c2_2a1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2184_l2154_DUPLICATE_3aa0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2184_l2154_DUPLICATE_3aa0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2158_c2_2a1f_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2184_l2154_DUPLICATE_3aa0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2184_l2154_DUPLICATE_3aa0_return_output;
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
