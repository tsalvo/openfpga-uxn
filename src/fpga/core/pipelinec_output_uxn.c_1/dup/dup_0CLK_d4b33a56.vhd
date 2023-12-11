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
-- BIN_OP_EQ[uxn_opcodes_h_l2780_c6_38b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2780_c2_9f9f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2793_c11_6cee]
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c7_ab0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2794_c30_9086]
signal sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2796_c11_a80b]
signal BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2796_c7_4df4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_2953]
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2802_c7_87e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_87e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_87e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8
BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output);

-- t8_MUX_uxn_opcodes_h_l2780_c2_9f9f
t8_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f
result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left,
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right,
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output);

-- t8_MUX_uxn_opcodes_h_l2793_c7_ab0a
t8_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a
result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2794_c30_9086
sp_relative_shift_uxn_opcodes_h_l2794_c30_9086 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins,
sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x,
sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y,
sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b
BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left,
BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right,
BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output);

-- t8_MUX_uxn_opcodes_h_l2796_c7_4df4
t8_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4
result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4
result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4
result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output,
 t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output,
 t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output,
 t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2785_c3_1cee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2790_c3_7efe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2798_c3_2306 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_c7_4df4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_477b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2796_l2793_DUPLICATE_c9ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2776_l2808_DUPLICATE_ee06_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2790_c3_7efe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2790_c3_7efe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2785_c3_1cee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2785_c3_1cee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2798_c3_2306 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2798_c3_2306;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_477b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_477b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2793_c11_6cee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2780_c6_38b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_c7_4df4_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2796_l2793_DUPLICATE_c9ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2796_l2793_DUPLICATE_c9ab_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2796_c11_a80b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_2953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_left;
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output := BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2794_c30_9086] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_ins;
     sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_x;
     sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output := sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c6_38b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_6cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2796_c11_a80b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_2953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_dac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2796_l2793_DUPLICATE_c9ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2796_l2793_DUPLICATE_c9ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2796_l2802_l2793_DUPLICATE_ca1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2780_l2802_l2793_DUPLICATE_28b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2780_c2_9f9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2794_c30_9086_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_87e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_87e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2802_c7_87e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_87e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2796_c7_4df4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2796_c7_4df4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c7_ab0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2793_c7_ab0a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2780_c2_9f9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2776_l2808_DUPLICATE_ee06 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2776_l2808_DUPLICATE_ee06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2780_c2_9f9f_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2776_l2808_DUPLICATE_ee06_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2776_l2808_DUPLICATE_ee06_return_output;
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
