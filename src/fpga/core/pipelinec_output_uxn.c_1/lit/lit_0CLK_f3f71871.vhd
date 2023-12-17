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
-- BIN_OP_EQ[uxn_opcodes_h_l190_c6_8569]
signal BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l190_c2_25e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l203_c11_147e]
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l203_c7_ded9]
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l206_c22_a0a4]
signal BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l208_c11_b81c]
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l208_c7_f9bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l208_c7_f9bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l208_c7_f9bf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l208_c7_f9bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l208_c7_f9bf]
signal result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569
BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left,
BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right,
BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3
result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3
result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3
result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e
BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9
result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9
result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9
result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4
BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left,
BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right,
BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c
BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left,
BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right,
BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf
result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf
result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_e2f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l206_c3_c1e0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l203_c7_ded9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_d49e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l203_c7_ded9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l211_c3_afeb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l208_c7_f9bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_64f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_3448_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l186_l216_DUPLICATE_191d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_d49e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_d49e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l211_c3_afeb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l211_c3_afeb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_e2f3 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l199_c3_e2f3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_3448 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_3448_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l203_c11_147e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_left;
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output := BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l190_c6_8569] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_left;
     BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output := BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l190_c2_25e3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l208_c11_b81c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_left;
     BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output := BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l206_c22_a0a4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l208_c7_f9bf_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_64f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_64f6_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l203_c7_ded9_return_output := result.sp_relative_shift;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l203_c7_ded9_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c6_8569_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_147e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_b81c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l206_c3_c1e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l206_c22_a0a4_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_3448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_3448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_64f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l203_l208_DUPLICATE_64f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_5d70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l203_l208_l190_DUPLICATE_8e52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l208_c7_f9bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l190_c2_25e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l190_c2_25e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue := VAR_result_u16_value_uxn_opcodes_h_l206_c3_c1e0;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l208_c7_f9bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l208_c7_f9bf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_ded9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_ded9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c2_25e3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l186_l216_DUPLICATE_191d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l186_l216_DUPLICATE_191d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c2_25e3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c2_25e3_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l186_l216_DUPLICATE_191d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l186_l216_DUPLICATE_191d_return_output;
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
