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
-- Submodules: 30
entity lit_0CLK_ac9ce6a4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_ac9ce6a4;
architecture arch of lit_0CLK_ac9ce6a4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l183_c6_01c4]
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_1749]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l183_c2_5b35]
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l184_c3_334e[uxn_opcodes_h_l184_c3_334e]
signal printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l190_c11_d2d4]
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l190_c7_1f16]
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_d1a7]
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l195_c11_15b3]
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_2468]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_2468]
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_2468]
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_2468]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l195_c7_2468]
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_e7d1]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_74ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_74ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4
BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35
result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35
result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

-- printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e
printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e : entity work.printf_uxn_opcodes_h_l184_c3_334e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4
BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16
result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16
result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3
BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468
result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_1667 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_5b35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l193_c3_c878 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_1f16_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_3708 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_4658_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l206_l179_DUPLICATE_bbb4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_3708 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_3708;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_1667 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_1667;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue := VAR_previous_ram_read;
     -- BIN_OP_EQ[uxn_opcodes_h_l190_c11_d2d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_e7d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_d1a7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l195_c11_15b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_1f16_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l183_c6_01c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_4658 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_4658_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504_return_output := result.u8_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_5b35_return_output := result.sp_relative_shift;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_1f16_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_01c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_d2d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_15b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e7d1_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l193_c3_c878 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_d1a7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l195_l201_l190_DUPLICATE_2481_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_4658_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_4658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_b62c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_a290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l195_l183_l190_DUPLICATE_d504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_5b35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue := VAR_result_u16_value_uxn_opcodes_h_l193_c3_c878;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_2468] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_2468] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_1749] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l195_c7_2468] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_cond;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output := result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_74ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_74ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_1749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_74ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_2468_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_74ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_2468_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_2468_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_2468] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_2468] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- printf_uxn_opcodes_h_l184_c3_334e[uxn_opcodes_h_l184_c3_334e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l184_c3_334e_uxn_opcodes_h_l184_c3_334e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_2468_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_2468_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_1f16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_1f16_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_5b35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l206_l179_DUPLICATE_bbb4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l206_l179_DUPLICATE_bbb4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_5b35_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_5b35_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l206_l179_DUPLICATE_bbb4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l206_l179_DUPLICATE_bbb4_return_output;
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
