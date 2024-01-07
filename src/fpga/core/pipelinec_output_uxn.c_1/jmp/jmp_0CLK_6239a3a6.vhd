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
entity jmp_0CLK_6239a3a6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_6239a3a6;
architecture arch of jmp_0CLK_6239a3a6 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l597_c6_8fa7]
signal BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l597_c2_16f3]
signal result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l597_c2_16f3]
signal t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l610_c11_eb22]
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l610_c7_a245]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_a245]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_a245]
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l610_c7_a245]
signal result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_a245]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l610_c7_a245]
signal t8_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l613_c11_a474]
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l613_c7_26c6]
signal result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_26c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_26c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_26c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l613_c7_26c6]
signal t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l615_c30_761e]
signal sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output : signed(3 downto 0);

-- u16_add_u8_as_i8[uxn_opcodes_h_l617_c22_8029]
signal u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16 : unsigned(15 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8 : unsigned(7 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output : unsigned(15 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_f623( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.u16_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7
BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left,
BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right,
BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3
result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- t8_MUX_uxn_opcodes_h_l597_c2_16f3
t8_MUX_uxn_opcodes_h_l597_c2_16f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond,
t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue,
t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse,
t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22
BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245
result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond,
result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- t8_MUX_uxn_opcodes_h_l610_c7_a245
t8_MUX_uxn_opcodes_h_l610_c7_a245 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l610_c7_a245_cond,
t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue,
t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse,
t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6
result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond,
result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output);

-- t8_MUX_uxn_opcodes_h_l613_c7_26c6
t8_MUX_uxn_opcodes_h_l613_c7_26c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond,
t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue,
t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse,
t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l615_c30_761e
sp_relative_shift_uxn_opcodes_h_l615_c30_761e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins,
sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x,
sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y,
sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output);

-- u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029
u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029 : entity work.u16_add_u8_as_i8_0CLK_e595f783 port map (
u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16,
u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8,
u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output,
 t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output,
 sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output,
 u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_04cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l602_c3_13d6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_0de4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l610_c7_a245_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output : signed(3 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16 : unsigned(15 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8 : unsigned(7 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_c4b5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_6500_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_dbc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l621_l593_DUPLICATE_346f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_0de4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_0de4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_04cb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l607_c3_04cb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l602_c3_13d6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l602_c3_13d6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins := VAR_ins;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16 := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue := VAR_previous_stack_read;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8 := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l613_c11_a474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_left;
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output := BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_6500 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_6500_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l597_c2_16f3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_dbc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_dbc3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_c4b5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_c4b5_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l615_c30_761e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_ins;
     sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_x;
     sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output := sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l610_c11_eb22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_left;
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output := BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;

     -- u16_add_u8_as_i8[uxn_opcodes_h_l617_c22_8029] LATENCY=0
     -- Inputs
     u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u16;
     u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_u8;
     -- Outputs
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output := u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l610_c7_a245_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l597_c6_8fa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l597_c6_8fa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_eb22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_c4b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_c4b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l613_l597_l610_DUPLICATE_73f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_6500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_6500_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_dbc3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l613_l610_DUPLICATE_dbc3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l597_c2_16f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l597_c2_16f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l615_c30_761e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue := VAR_u16_add_u8_as_i8_uxn_opcodes_h_l617_c22_8029_return_output;
     -- t8_MUX[uxn_opcodes_h_l613_c7_26c6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond <= VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_cond;
     t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue;
     t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output := t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l613_c7_26c6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output := result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_26c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_26c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_26c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse := VAR_t8_MUX_uxn_opcodes_h_l613_c7_26c6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output := result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- t8_MUX[uxn_opcodes_h_l610_c7_a245] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l610_c7_a245_cond <= VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_cond;
     t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iftrue;
     t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output := t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l610_c7_a245_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- t8_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l597_c2_16f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l597_c2_16f3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l621_l593_DUPLICATE_346f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l621_l593_DUPLICATE_346f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f623(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l597_c2_16f3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l597_c2_16f3_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l621_l593_DUPLICATE_346f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l621_l593_DUPLICATE_346f_return_output;
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
