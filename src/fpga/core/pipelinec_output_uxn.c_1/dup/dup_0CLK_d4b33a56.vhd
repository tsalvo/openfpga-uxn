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
-- Submodules: 31
entity dup_0CLK_d4b33a56 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup_0CLK_d4b33a56;
architecture arch of dup_0CLK_d4b33a56 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2773_c6_3bf5]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2773_c2_bbf0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_95c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2786_c7_6080]
signal t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_6080]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_6080]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2786_c7_6080]
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_6080]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_6080]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2787_c30_7c12]
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_3263]
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2789_c7_c4c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2795_c11_493d]
signal BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2795_c7_b5de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2795_c7_b5de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2795_c7_b5de]
signal result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5
BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output);

-- t8_MUX_uxn_opcodes_h_l2773_c2_bbf0
t8_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0
result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output);

-- t8_MUX_uxn_opcodes_h_l2786_c7_6080
t8_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12
sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins,
sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x,
sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y,
sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output);

-- t8_MUX_uxn_opcodes_h_l2789_c7_c4c2
t8_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d
BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left,
BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right,
BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de
result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de
result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output,
 t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output,
 t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output,
 sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output,
 t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2783_c3_9ff7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2778_c3_eb2b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2791_c3_b831 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2789_c7_c4c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_60e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_l2786_DUPLICATE_f1e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2801_l2769_DUPLICATE_c0ae_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2783_c3_9ff7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2783_c3_9ff7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_60e4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_60e4;
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2791_c3_b831 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2791_c3_b831;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2778_c3_eb2b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2778_c3_eb2b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_l2786_DUPLICATE_f1e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_l2786_DUPLICATE_f1e0_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2789_c7_c4c2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_95c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2787_c30_7c12] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_ins;
     sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_x;
     sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output := sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2795_c11_493d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c6_3bf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_3263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_left;
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output := BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c6_3bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_95c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_3263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2795_c11_493d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_2479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_l2786_DUPLICATE_f1e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_l2786_DUPLICATE_f1e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2789_l2795_l2786_DUPLICATE_3ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2795_l2786_DUPLICATE_341c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2773_c2_bbf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_7c12_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2795_c7_b5de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2795_c7_b5de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2795_c7_b5de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2795_c7_b5de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_c4c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_c4c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2786_c7_6080] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output := result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_6080_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c2_bbf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2801_l2769_DUPLICATE_c0ae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2801_l2769_DUPLICATE_c0ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2773_c2_bbf0_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2801_l2769_DUPLICATE_c0ae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2801_l2769_DUPLICATE_c0ae_return_output;
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
