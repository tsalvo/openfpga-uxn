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
-- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_4b04]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_7f9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_e4d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2768_c7_337a]
signal t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_337a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_337a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_337a]
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_337a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_337a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2769_c30_06df]
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_9641]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2771_c7_b885]
signal t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_b885]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_b885]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_b885]
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_b885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_b885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_1c06]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_9645]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_9645]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2777_c7_9645]
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output);

-- t8_MUX_uxn_opcodes_h_l2755_c2_7f9e
t8_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output);

-- t8_MUX_uxn_opcodes_h_l2768_c7_337a
t8_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2769_c30_06df
sp_relative_shift_uxn_opcodes_h_l2769_c30_06df : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins,
sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x,
sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y,
sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output);

-- t8_MUX_uxn_opcodes_h_l2771_c7_b885
t8_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output,
 t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output,
 t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output,
 t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_92f0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_cc15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_ca61 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_b885_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_ab54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2771_l2768_DUPLICATE_c9a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2751_l2783_DUPLICATE_3e6c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_ab54 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_ab54;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_ca61 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_ca61;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_92f0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_92f0;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_cc15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_cc15;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_4b04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_9641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2771_l2768_DUPLICATE_c9a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2771_l2768_DUPLICATE_c9a5_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_b885_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2769_c30_06df] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_ins;
     sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_x;
     sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output := sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_1c06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_e4d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_4b04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_e4d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_9641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_1c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_829c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2771_l2768_DUPLICATE_c9a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2771_l2768_DUPLICATE_c9a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2771_l2777_l2768_DUPLICATE_d0f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2755_l2777_l2768_DUPLICATE_ee94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_7f9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_06df_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- t8_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_9645] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2777_c7_9645] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output := result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_9645] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_9645_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- t8_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_b885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_b885_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_337a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_337a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_7f9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2751_l2783_DUPLICATE_3e6c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2751_l2783_DUPLICATE_3e6c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_7f9e_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2751_l2783_DUPLICATE_3e6c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2751_l2783_DUPLICATE_3e6c_return_output;
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
