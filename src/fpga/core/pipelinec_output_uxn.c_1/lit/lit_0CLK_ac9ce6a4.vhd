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
-- BIN_OP_EQ[uxn_opcodes_h_l194_c6_9af8]
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l194_c1_5f8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l194_c2_c6e1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l195_c3_b5d0[uxn_opcodes_h_l195_c3_b5d0]
signal printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_78bb]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l201_c7_daa0]
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l205_c22_3bdb]
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l207_c11_c32e]
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l207_c7_6a0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l207_c7_6a0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l207_c7_6a0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l207_c7_6a0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l207_c7_6a0c]
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l213_c11_a3fc]
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l213_c7_5541]
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l213_c7_5541]
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_7de8( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8
BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left,
BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right,
BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1
result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1
result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

-- printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0
printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0 : entity work.printf_uxn_opcodes_h_l195_c3_b5d0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb
BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0
result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0
result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left,
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right,
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e
BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left,
BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right,
BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c
result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc
BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left,
BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right,
BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_4786 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_c6e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l205_c3_2121 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_daa0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_b360 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l207_l194_DUPLICATE_8f46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l218_l190_DUPLICATE_6b12_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_4786 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_4786;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_b360 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_b360;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l194_c6_9af8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_left;
     BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output := BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99_return_output := result.is_opc_done;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_daa0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_c6e1_return_output := result.sp_relative_shift;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_daa0_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l213_c11_a3fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l207_c11_c32e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_left;
     BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output := BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l207_l194_DUPLICATE_8f46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l207_l194_DUPLICATE_8f46_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_78bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l205_c22_3bdb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_9af8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_78bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_c32e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_a3fc_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l205_c3_2121 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_3bdb_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l207_l201_l213_DUPLICATE_1b99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l207_l194_DUPLICATE_8f46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l207_l194_DUPLICATE_8f46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l201_l213_DUPLICATE_d833_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_2ae9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l207_l194_l201_DUPLICATE_3010_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_c6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l205_c3_2121;
     -- result_u8_value_MUX[uxn_opcodes_h_l207_c7_6a0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l207_c7_6a0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l213_c7_5541] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l207_c7_6a0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l194_c1_5f8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l213_c7_5541] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l194_c1_5f8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_5541_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_5541_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l207_c7_6a0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;

     -- printf_uxn_opcodes_h_l195_c3_b5d0[uxn_opcodes_h_l195_c3_b5d0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l195_c3_b5d0_uxn_opcodes_h_l195_c3_b5d0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l207_c7_6a0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_6a0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_daa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_daa0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l194_c2_c6e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l218_l190_DUPLICATE_6b12 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l218_l190_DUPLICATE_6b12_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7de8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_c6e1_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l218_l190_DUPLICATE_6b12_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l218_l190_DUPLICATE_6b12_return_output;
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
