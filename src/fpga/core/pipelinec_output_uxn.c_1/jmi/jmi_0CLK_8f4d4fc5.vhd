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
-- Submodules: 32
entity jmi_0CLK_8f4d4fc5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_8f4d4fc5;
architecture arch of jmi_0CLK_8f4d4fc5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l109_c6_359c]
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l109_c1_6712]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l109_c2_3bec]
signal tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l109_c2_3bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l109_c2_3bec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l109_c2_3bec]
signal result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l110_c3_1bf3[uxn_opcodes_h_l110_c3_1bf3]
signal printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l114_c11_c676]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c7_1f6f]
signal tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_1f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_1f6f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l114_c7_1f6f]
signal result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l115_c22_7880]
signal BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l117_c11_11e1]
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l117_c7_f55b]
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l117_c7_f55b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c7_f55b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l117_c7_f55b]
signal result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l119_c3_d130]
signal CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l121_c11_7596]
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l121_c7_8e4f]
signal tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_8e4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_8e4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l121_c7_8e4f]
signal result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l122_c3_b363]
signal BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c23_2475]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c23_11db]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_57d5]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_f67d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_f67d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_81cc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c
BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left,
BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right,
BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output);

-- tmp16_MUX_uxn_opcodes_h_l109_c2_3bec
tmp16_MUX_uxn_opcodes_h_l109_c2_3bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond,
tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue,
tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse,
tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec
result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond,
result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output);

-- printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3
printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3 : entity work.printf_uxn_opcodes_h_l110_c3_1bf3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676
BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f
tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond,
tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f
result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond,
result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880
BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left,
BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right,
BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1
BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left,
BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right,
BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l117_c7_f55b
tmp16_MUX_uxn_opcodes_h_l117_c7_f55b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond,
tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue,
tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse,
tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b
result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond,
result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l119_c3_d130
CONST_SL_8_uxn_opcodes_h_l119_c3_d130 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x,
CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596
BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output);

-- tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f
tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond,
tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue,
tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse,
tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f
result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l122_c3_b363
BIN_OP_OR_uxn_opcodes_h_l122_c3_b363 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left,
BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right,
BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5
BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output,
 tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output,
 CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output,
 tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l115_c3_4eaf : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_6197 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l122_DUPLICATE_b8d0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l121_l117_DUPLICATE_5bc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81cc_uxn_opcodes_h_l105_l131_DUPLICATE_5abb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l122_DUPLICATE_b8d0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l122_DUPLICATE_b8d0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c11_c676] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_57d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l121_l117_DUPLICATE_5bc3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l121_l117_DUPLICATE_5bc3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l109_c6_359c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_left;
     BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output := BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l121_c11_7596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_left;
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output := BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l115_c22_7880] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_left;
     BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output := BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l117_c11_11e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_359c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_c676_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_11e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_7596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_57d5_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l115_c3_4eaf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l115_c22_7880_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l122_DUPLICATE_b8d0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l122_DUPLICATE_b8d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l121_l117_DUPLICATE_5bc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l121_l117_DUPLICATE_5bc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l121_l114_l126_l117_DUPLICATE_4630_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l114_l126_l117_l109_DUPLICATE_7b5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l115_c3_4eaf;
     -- CONST_SL_8[uxn_opcodes_h_l119_c3_d130] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x <= VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output := CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_f67d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_f67d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l122_c3_b363] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_left;
     BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output := BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l109_c1_6712] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right := VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l122_c3_b363_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_d130_return_output;
     VAR_printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_6712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_f67d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_f67d_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c23_2475] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_8e4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;

     -- printf_uxn_opcodes_h_l110_c3_1bf3[uxn_opcodes_h_l110_c3_1bf3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l110_c3_1bf3_uxn_opcodes_h_l110_c3_1bf3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_8e4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l121_c7_8e4f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_cond;
     tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output := tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_2475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l117_c7_f55b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c7_f55b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l117_c7_f55b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_cond;
     tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output := tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c23_11db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_6197 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c23_11db_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_6197;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c7_1f6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output := tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l121_c7_8e4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l121_c7_8e4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l109_c2_3bec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_cond;
     tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output := tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l109_c2_3bec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l117_c7_f55b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output := result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l109_c2_3bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l117_c7_f55b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_3bec_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l114_c7_1f6f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output := result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c7_1f6f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l109_c2_3bec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output := result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81cc_uxn_opcodes_h_l105_l131_DUPLICATE_5abb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81cc_uxn_opcodes_h_l105_l131_DUPLICATE_5abb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81cc(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_3bec_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l109_c2_3bec_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81cc_uxn_opcodes_h_l105_l131_DUPLICATE_5abb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81cc_uxn_opcodes_h_l105_l131_DUPLICATE_5abb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
