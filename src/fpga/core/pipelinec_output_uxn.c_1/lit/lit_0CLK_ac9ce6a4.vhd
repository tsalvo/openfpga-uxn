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
-- BIN_OP_EQ[uxn_opcodes_h_l191_c6_aa4c]
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_8e59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_9342]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l192_c3_5753[uxn_opcodes_h_l192_c3_5753]
signal printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_738e]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l198_c7_8b7e]
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l202_c22_5327]
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_ea19]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_1bc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_1bc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_1bc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_1bc2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l204_c7_1bc2]
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l210_c11_ad26]
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_0f97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_0f97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3985( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c
BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342
result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342
result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

-- printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753
printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753 : entity work.printf_uxn_opcodes_h_l192_c3_5753_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e
BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e
result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e
result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left,
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right,
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2
result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26
BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_102c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_9342_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l202_c3_a812 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_164a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_9d16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l187_l215_DUPLICATE_ad3c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_164a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_164a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_102c := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_102c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_9d16 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_9d16_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l191_c6_aa4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847_return_output := result.u8_value;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l202_c22_5327] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_left;
     BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output := BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_9342_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131_return_output := result.stack_address_sp_offset;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_ea19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_738e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l210_c11_ad26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_left;
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output := BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_aa4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_738e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_ea19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_ad26_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l202_c3_a812 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_5327_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_f212_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_9d16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_9d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_4931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_0131_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_f847_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_9342_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l202_c3_a812;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_1bc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l204_c7_1bc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_0f97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_0f97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_8e59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_8e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_0f97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_0f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;

     -- printf_uxn_opcodes_h_l192_c3_5753[uxn_opcodes_h_l192_c3_5753] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l192_c3_5753_uxn_opcodes_h_l192_c3_5753_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_1bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_8b7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_8b7e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_9342] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l187_l215_DUPLICATE_ad3c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l187_l215_DUPLICATE_ad3c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3985(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_9342_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_9342_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l187_l215_DUPLICATE_ad3c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l187_l215_DUPLICATE_ad3c_return_output;
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
