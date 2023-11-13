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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_6722]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_6028]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_81b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_81b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_81b4]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_81b4]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l112_c3_3a0e[uxn_opcodes_h_l112_c3_3a0e]
signal printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_87ba]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_3c48]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_3c48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_3c48]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_3c48]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_0b34]
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_d947]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_c787]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_c787]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_c787]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_c787]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_53d1]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_4d31]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_9ca3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_9ca3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_9ca3]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_9ca3]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l124_c3_195d]
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_2583]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_31ae]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_096c]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_8750]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_8750]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722
BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4
result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_81b4
tmp16_MUX_uxn_opcodes_h_l111_c2_81b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output);

-- printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e
printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e : entity work.printf_uxn_opcodes_h_l112_c3_3a0e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba
BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_3c48
tmp16_MUX_uxn_opcodes_h_l116_c7_3c48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947
BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787
result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_c787
tmp16_MUX_uxn_opcodes_h_l119_c7_c787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_53d1
CONST_SL_8_uxn_opcodes_h_l121_c3_53d1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31
BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3
tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l124_c3_195d
BIN_OP_OR_uxn_opcodes_h_l124_c3_195d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left,
BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right,
BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c
BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l117_c3_fe88 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l126_c3_ecab : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_74ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_f451_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_42cb_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_4d31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_87ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_74ec LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_74ec_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_096c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_f451 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_f451_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_d947] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_6722] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_0b34] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_left;
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output := BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_6722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_87ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_d947_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_4d31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_096c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l117_c3_fe88 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_0b34_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_74ec_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_74ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_f451_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_f451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l119_l123_l116_DUPLICATE_bae2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l119_l111_l116_DUPLICATE_ee21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue := VAR_result_u16_value_uxn_opcodes_h_l117_c3_fe88;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_8750] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_6028] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l124_c3_195d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_left;
     BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output := BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_8750] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l121_c3_53d1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_195d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_53d1_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_6028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_8750_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_8750_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_9ca3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_9ca3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_2583] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output;

     -- printf_uxn_opcodes_h_l112_c3_3a0e[uxn_opcodes_h_l112_c3_3a0e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_3a0e_uxn_opcodes_h_l112_c3_3a0e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_9ca3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_2583_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_c787] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_c787] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_31ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_c787] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l126_c3_ecab := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_31ae_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c787_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c787_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c787_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l126_c3_ecab;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_3c48] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_9ca3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_3c48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_3c48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9ca3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l111_c2_81b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_81b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_81b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_c787] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_c787_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_81b4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_3c48] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_3c48_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_81b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_42cb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_42cb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f073(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_81b4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_81b4_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_42cb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_42cb_return_output;
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
