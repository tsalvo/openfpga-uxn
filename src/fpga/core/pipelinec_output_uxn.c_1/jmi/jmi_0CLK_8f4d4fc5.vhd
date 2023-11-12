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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_3d3e]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_d91b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_64a8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_64a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_64a8]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_64a8]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l112_c3_791c[uxn_opcodes_h_l112_c3_791c]
signal printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_13f1]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_3e73]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_3e73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_3e73]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_3e73]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_183e]
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_cb8d]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_ba2c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_ba2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_ba2c]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_ba2c]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_980a]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_ac5e]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_4322]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_4322]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_4322]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_4322]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l124_c3_9808]
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_1bc1]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_0777]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_d57c]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_170e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_170e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f073( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.u16_value := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e
BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8
result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_64a8
tmp16_MUX_uxn_opcodes_h_l111_c2_64a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output);

-- printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c
printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c : entity work.printf_uxn_opcodes_h_l112_c3_791c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1
BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_3e73
tmp16_MUX_uxn_opcodes_h_l116_c7_3e73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d
BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c
result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c
tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_980a
CONST_SL_8_uxn_opcodes_h_l121_c3_980a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e
BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322
result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_4322
tmp16_MUX_uxn_opcodes_h_l123_c7_4322 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l124_c3_9808
BIN_OP_OR_uxn_opcodes_h_l124_c3_9808 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left,
BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right,
BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c
BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output,
 BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l117_c3_90f7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l126_c3_a973 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_80f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_fe82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_33a9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_183e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_13f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_3d3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_fe82 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_fe82_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_d57c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_ac5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_cb8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_80f6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_80f6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_3d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_13f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_cb8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_ac5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_d57c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l117_c3_90f7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_183e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_80f6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_80f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_fe82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_fe82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_ba82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_851a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue := VAR_result_u16_value_uxn_opcodes_h_l117_c3_90f7;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_170e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_d91b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l124_c3_9808] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_left;
     BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output := BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l121_c3_980a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_170e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_9808_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_980a_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_d91b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_170e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_170e_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_1bc1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output;

     -- printf_uxn_opcodes_h_l112_c3_791c[uxn_opcodes_h_l112_c3_791c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_791c_uxn_opcodes_h_l112_c3_791c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_4322] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_4322] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_4322] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_1bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_4322_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_4322_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_4322_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l119_c7_ba2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_0777] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_ba2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_ba2c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l126_c3_a973 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0777_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue := VAR_result_u16_value_uxn_opcodes_h_l126_c3_a973;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_4322] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_3e73] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_3e73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_3e73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_4322_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_64a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_ba2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l111_c2_64a8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_64a8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_ba2c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_64a8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_3e73] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3e73_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_64a8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_33a9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_33a9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f073(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_64a8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_64a8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_33a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_33a9_return_output;
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
