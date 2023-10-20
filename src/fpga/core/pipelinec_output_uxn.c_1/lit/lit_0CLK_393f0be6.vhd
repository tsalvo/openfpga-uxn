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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 28
entity lit_0CLK_393f0be6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_393f0be6;
architecture arch of lit_0CLK_393f0be6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l194_c6_07b1]
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l194_c2_6a59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_e14c]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c7_8489]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l205_c22_6a5d]
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l207_c11_cc95]
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l207_c7_2d3f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l207_c7_2d3f]
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l207_c7_2d3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l207_c7_2d3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l207_c7_2d3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l213_c11_beff]
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l213_c7_e1c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l213_c7_e1c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1
BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left,
BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right,
BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59
result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59
result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489
result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489
result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left,
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right,
BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95
BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left,
BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right,
BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f
result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff
BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left,
BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right,
BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_83eb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_6a59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l205_c3_d367 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_8489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_d40c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l194_l207_DUPLICATE_c659_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l218_l190_DUPLICATE_6376_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_d40c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l210_c3_d40c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_83eb := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l197_c3_83eb;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue := VAR_previous_ram_read;
     -- BIN_OP_EQ[uxn_opcodes_h_l194_c6_07b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l205_c22_6a5d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l213_c11_beff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_left;
     BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output := BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_e14c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_6a59_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l207_c11_cc95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_left;
     BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output := BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_8489_return_output := result.u16_value;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_8489_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l194_l207_DUPLICATE_c659 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l194_l207_DUPLICATE_c659_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l194_c6_07b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_e14c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l207_c11_cc95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l213_c11_beff_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l205_c3_d367 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l205_c22_6a5d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l213_l201_l207_DUPLICATE_15a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l194_l207_DUPLICATE_c659_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l194_l207_DUPLICATE_c659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l194_l213_l201_DUPLICATE_a97b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_05a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l194_l201_l207_DUPLICATE_ec90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l194_c2_6a59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue := VAR_result_u16_value_uxn_opcodes_h_l205_c3_d367;
     -- result_u8_value_MUX[uxn_opcodes_h_l207_c7_2d3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l207_c7_2d3f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l213_c7_e1c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l213_c7_e1c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l207_c7_2d3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l213_c7_e1c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l207_c7_2d3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l207_c7_2d3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l207_c7_2d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_8489] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_8489_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l194_c2_6a59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l218_l190_DUPLICATE_6376 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l218_l190_DUPLICATE_6376_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l194_c2_6a59_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l194_c2_6a59_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l218_l190_DUPLICATE_6376_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l218_l190_DUPLICATE_6376_return_output;
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
