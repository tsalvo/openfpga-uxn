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
-- Submodules: 29
entity sth_0CLK_a9f1e08f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth_0CLK_a9f1e08f;
architecture arch of sth_0CLK_a9f1e08f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2403_c6_d10f]
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2403_c2_7223]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2403_c2_7223]
signal t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_f17d]
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2416_c7_5d41]
signal t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2417_c30_5bb6]
signal sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_de15]
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2419_c7_4ecf]
signal t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f
BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left,
BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right,
BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223
result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223
result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- t8_MUX_uxn_opcodes_h_l2403_c2_7223
t8_MUX_uxn_opcodes_h_l2403_c2_7223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond,
t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue,
t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse,
t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41
result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- t8_MUX_uxn_opcodes_h_l2416_c7_5d41
t8_MUX_uxn_opcodes_h_l2416_c7_5d41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond,
t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue,
t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse,
t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6
sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins,
sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x,
sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y,
sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);

-- t8_MUX_uxn_opcodes_h_l2419_c7_4ecf
t8_MUX_uxn_opcodes_h_l2419_c7_4ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond,
t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue,
t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse,
t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output,
 sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output,
 t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2408_c3_a6f6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_6698 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2422_c3_fc3c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_c7_4ecf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_7826 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_e1d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_3d3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_a150_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_ca6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2399_l2429_DUPLICATE_6625_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_6698 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_6698;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2408_c3_a6f6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2408_c3_a6f6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2422_c3_fc3c := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2422_c3_fc3c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_7826 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_7826;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := t8;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_c7_4ecf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2403_c6_d10f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_e1d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_e1d5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_de15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_left;
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output := BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_a150 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_a150_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_ca6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_ca6e_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_f17d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_3d3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_3d3f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2403_c2_7223_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2417_c30_5bb6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_ins;
     sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_x;
     sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output := sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c6_d10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_f17d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_de15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_e1d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_e1d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_3d3f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_3d3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_ca6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_ca6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_a150_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2416_DUPLICATE_a150_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2403_l2416_DUPLICATE_3d2d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2403_c2_7223_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2403_c2_7223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2417_c30_5bb6_return_output;
     -- t8_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_4ecf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2419_c7_4ecf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- t8_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_5d41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2416_c7_5d41_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- t8_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c2_7223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2403_c2_7223_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2399_l2429_DUPLICATE_6625 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2399_l2429_DUPLICATE_6625_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c2_7223_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2403_c2_7223_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2399_l2429_DUPLICATE_6625_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2399_l2429_DUPLICATE_6625_return_output;
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
