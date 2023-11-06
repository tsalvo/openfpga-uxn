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
-- BIN_OP_EQ[uxn_opcodes_h_l183_c6_9311]
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_cc70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_e22b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l184_c3_0cc2[uxn_opcodes_h_l184_c3_0cc2]
signal printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l190_c11_150d]
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_8050]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_06fd]
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l195_c11_67c1]
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_da3e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l195_c7_da3e]
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_da3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_da3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_da3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_eec8]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_f04a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_f04a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_2af2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b
result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b
result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

-- printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2
printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2 : entity work.printf_uxn_opcodes_h_l184_c3_0cc2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d
BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050
result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050
result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1
BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e
result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8
BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b08d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_e22b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l193_c3_c04a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_15e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_2fa5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2af2_uxn_opcodes_h_l206_l179_DUPLICATE_fb51_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_15e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_15e2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b08d := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b08d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue := VAR_previous_ram_read;
     -- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_06fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l195_c11_67c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l183_c6_9311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_left;
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output := BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_8050_return_output := result.is_sp_shift;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_e22b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l190_c11_150d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_left;
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output := BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_eec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_8050_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_2fa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_2fa5_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_9311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_150d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_67c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_eec8_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l193_c3_c04a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_06fd_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l190_l195_l201_DUPLICATE_7a15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_2fa5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l195_l183_DUPLICATE_2fa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l190_l183_l201_DUPLICATE_c67a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_7d83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l190_l195_l183_DUPLICATE_5869_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_e22b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue := VAR_result_u16_value_uxn_opcodes_h_l193_c3_c04a;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_da3e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l195_c7_da3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output := result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_cc70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_f04a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_f04a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_da3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_cc70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_f04a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_f04a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_da3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_da3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- printf_uxn_opcodes_h_l184_c3_0cc2[uxn_opcodes_h_l184_c3_0cc2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l184_c3_0cc2_uxn_opcodes_h_l184_c3_0cc2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_da3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_8050] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_8050_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_e22b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2af2_uxn_opcodes_h_l206_l179_DUPLICATE_fb51 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2af2_uxn_opcodes_h_l206_l179_DUPLICATE_fb51_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2af2(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_e22b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_e22b_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2af2_uxn_opcodes_h_l206_l179_DUPLICATE_fb51_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2af2_uxn_opcodes_h_l206_l179_DUPLICATE_fb51_return_output;
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
