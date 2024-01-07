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
-- BIN_OP_EQ[uxn_opcodes_h_l2386_c6_46ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2386_c2_7c7a]
signal t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_a6e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2399_c7_eb53]
signal t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2400_c30_dfa3]
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_83de]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_5583]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2402_c7_5583]
signal t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- t8_MUX_uxn_opcodes_h_l2386_c2_7c7a
t8_MUX_uxn_opcodes_h_l2386_c2_7c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond,
t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue,
t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse,
t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- t8_MUX_uxn_opcodes_h_l2399_c7_eb53
t8_MUX_uxn_opcodes_h_l2399_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond,
t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue,
t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse,
t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3
sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins,
sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x,
sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y,
sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);

-- t8_MUX_uxn_opcodes_h_l2402_c7_5583
t8_MUX_uxn_opcodes_h_l2402_c7_5583 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond,
t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue,
t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse,
t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output,
 sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output,
 t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_953f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_79a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_52a9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_5583_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_99b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_bf47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_37bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_6269_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_1b20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2382_l2412_DUPLICATE_bee9_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_953f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_953f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_79a2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_79a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_99b5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_99b5;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_52a9 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_52a9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := t8;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_5583_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2386_c6_46ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_37bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_37bf_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_1b20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_1b20_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2400_c30_dfa3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_ins;
     sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_x;
     sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output := sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_bf47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_bf47_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_83de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_6269 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_6269_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_a6e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_46ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_a6e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_83de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_1b20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_1b20_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_37bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_37bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_bf47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_bf47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_6269_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2399_l2402_DUPLICATE_6269_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2399_l2402_l2386_DUPLICATE_031c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_7c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_dfa3_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_5583] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2402_c7_5583_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- t8_MUX[uxn_opcodes_h_l2399_c7_eb53] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_cond;
     t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iftrue;
     t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output := t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2399_c7_eb53_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2386_c2_7c7a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_cond;
     t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iftrue;
     t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output := t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2382_l2412_DUPLICATE_bee9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2382_l2412_DUPLICATE_bee9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_7c7a_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2382_l2412_DUPLICATE_bee9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2382_l2412_DUPLICATE_bee9_return_output;
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
