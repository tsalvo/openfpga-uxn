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
-- BIN_OP_EQ[uxn_opcodes_h_l183_c6_9571]
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_7206]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_0852]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l184_c3_71a4[uxn_opcodes_h_l184_c3_71a4]
signal printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l190_c11_e55e]
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l190_c7_72c3]
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_b13b]
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l195_c11_ff23]
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_376e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_376e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_376e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_376e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l195_c7_376e]
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_c71e]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_06b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_06b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_bc18( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852
result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852
result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

-- printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4
printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4 : entity work.printf_uxn_opcodes_h_l184_c3_71a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e
BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3
result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3
result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23
BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e
result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e
BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_a7df : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_0852_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l193_c3_cb12 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_72c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_62e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_d338_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l206_l179_DUPLICATE_2d62_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_62e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_62e6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_a7df := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_a7df;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee_return_output := result.is_stack_write;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_72c3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_c71e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_d338 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_d338_return_output := result.is_pc_updated;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_72c3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l195_c11_ff23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_left;
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output := BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_0852_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l190_c11_e55e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_left;
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output := BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_b13b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l183_c6_9571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_left;
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output := BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_e55e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_ff23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_c71e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l193_c3_cb12 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_b13b_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_63bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_d338_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_d338_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_40ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_7544_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_b6cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_0852_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l193_c3_cb12;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_376e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l195_c7_376e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output := result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_06b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_06b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_376e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_7206] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_7206_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_06b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_376e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_06b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_376e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_376e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- printf_uxn_opcodes_h_l184_c3_71a4[uxn_opcodes_h_l184_c3_71a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l184_c3_71a4_uxn_opcodes_h_l184_c3_71a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u16_value_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_376e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_376e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_376e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_376e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_72c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_72c3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_0852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l206_l179_DUPLICATE_2d62 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l206_l179_DUPLICATE_2d62_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_bc18(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_0852_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_0852_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l206_l179_DUPLICATE_2d62_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l206_l179_DUPLICATE_2d62_return_output;
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
