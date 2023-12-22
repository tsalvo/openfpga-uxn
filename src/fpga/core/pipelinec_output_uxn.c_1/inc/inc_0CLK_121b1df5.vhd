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
entity inc_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_121b1df5;
architecture arch of inc_0CLK_121b1df5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_b829]
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1341_c2_7c09]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6b9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1354_c7_7f4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_c7ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_d7bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1359_c30_2298]
signal sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1362_c21_e061]
signal BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output);

-- t8_MUX_uxn_opcodes_h_l1341_c2_7c09
t8_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09
result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output);

-- t8_MUX_uxn_opcodes_h_l1354_c7_7f4d
t8_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output);

-- t8_MUX_uxn_opcodes_h_l1357_c7_d7bf
t8_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf
result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1359_c30_2298
sp_relative_shift_uxn_opcodes_h_l1359_c30_2298 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins,
sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x,
sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y,
sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061
BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left,
BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right,
BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output,
 t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output,
 t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output,
 t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_9815 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1346_c3_1eea : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_4e26 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_4b10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_c7_d7bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1362_c3_e8f8 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_fd44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_5c2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_2b0d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1337_l1366_DUPLICATE_59eb_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_4e26 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_4e26;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1346_c3_1eea := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1346_c3_1eea;
     VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_4b10 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_4b10;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_9815 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_9815;
     VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_5c2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_5c2f_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_2b0d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_2b0d_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_c7_d7bf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6b9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1359_c30_2298] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_ins;
     sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_x;
     sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output := sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_fd44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_fd44_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1362_c21_e061] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_b829] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_left;
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output := BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_c7ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_b829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_c7ce_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1362_c3_e8f8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1362_c21_e061_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_2b0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_2b0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_fd44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_fd44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_5c2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1354_DUPLICATE_5c2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1357_l1341_l1354_DUPLICATE_a49e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1341_c2_7c09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1359_c30_2298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1362_c3_e8f8;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- t8_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_d7bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1357_c7_d7bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1354_c7_7f4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1354_c7_7f4d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- t8_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1341_c2_7c09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1337_l1366_DUPLICATE_59eb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1337_l1366_DUPLICATE_59eb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1341_c2_7c09_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1337_l1366_DUPLICATE_59eb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1337_l1366_DUPLICATE_59eb_return_output;
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
