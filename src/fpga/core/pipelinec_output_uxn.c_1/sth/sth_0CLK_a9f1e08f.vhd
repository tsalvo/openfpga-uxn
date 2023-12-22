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
-- BIN_OP_EQ[uxn_opcodes_h_l2404_c6_8e59]
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2404_c2_a25f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2417_c11_5b7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2417_c7_7ae4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2418_c30_9559]
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_6786]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2420_c7_c609]
signal t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2420_c7_c609]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left,
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right,
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output);

-- t8_MUX_uxn_opcodes_h_l2404_c2_a25f
t8_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f
result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f
result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output);

-- t8_MUX_uxn_opcodes_h_l2417_c7_7ae4
t8_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2418_c30_9559
sp_relative_shift_uxn_opcodes_h_l2418_c30_9559 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins,
sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x,
sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y,
sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output);

-- t8_MUX_uxn_opcodes_h_l2420_c7_c609
t8_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609
result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output,
 t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output,
 t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output,
 sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output,
 t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_e60c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2409_c3_7ed0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2425_c3_878b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2423_c3_f2c6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2420_c7_c609_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_6863_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_4cf8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_c792_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_75b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2400_l2430_DUPLICATE_4d0f_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2425_c3_878b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2425_c3_878b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_e60c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_e60c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2409_c3_7ed0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2409_c3_7ed0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2423_c3_f2c6 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2423_c3_f2c6;
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y := resize(to_signed(-1, 2), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2417_c11_5b7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2404_c6_8e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_6863 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_6863_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2420_c7_c609_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_6786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_75b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_75b1_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_c792 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_c792_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2418_c30_9559] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_ins;
     sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_x;
     sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output := sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_4cf8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_4cf8_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_8e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_5b7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_6786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_6863_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_6863_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_75b1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_75b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_c792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_c792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_4cf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2420_l2417_DUPLICATE_4cf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2420_l2404_l2417_DUPLICATE_2715_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2404_c2_a25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_9559_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- t8_MUX[uxn_opcodes_h_l2420_c7_c609] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond <= VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_cond;
     t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iftrue;
     t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output := t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2420_c7_c609_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2417_c7_7ae4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_cond;
     t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iftrue;
     t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output := t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2417_c7_7ae4_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c2_a25f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2400_l2430_DUPLICATE_4d0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2400_l2430_DUPLICATE_4d0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2404_c2_a25f_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2400_l2430_DUPLICATE_4d0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2400_l2430_DUPLICATE_4d0f_return_output;
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
