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
entity jmi_0CLK_fa355561 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_fa355561;
architecture arch of jmi_0CLK_fa355561 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l116_c6_4012]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c2_5cf9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c2_5cf9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c2_5cf9]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c2_5cf9]
signal tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_e055]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_9b97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_9b97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_9b97]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_9b97]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_b057]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_a0b5]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_aa4c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_aa4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_aa4c]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_aa4c]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_fe3b]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_c050]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_f2f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_f2f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_f2f0]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_f2f0]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_9edc]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_b924]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_86ff]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l135_c11_a772]
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_2202]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_2202]
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012
BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9
result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9
result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9
tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond,
tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055
BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_9b97
tmp16_MUX_uxn_opcodes_h_l123_c7_9b97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5
BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c
result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c
tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b
CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0
result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0
tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc
BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772
BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_c85a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_16bc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b8b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_1892_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l112_DUPLICATE_0fb4_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l135_c11_a772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_left;
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output := BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b8b7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b8b7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_b057] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_e055] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c6_4012] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_a0b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_c050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_1892 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_1892_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c6_4012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_e055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_a0b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_a772_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_c85a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_b057_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b8b7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b8b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_1892_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_1892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l135_l126_DUPLICATE_a8ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l123_l135_l126_DUPLICATE_8a56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_c85a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_2202] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_fe3b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_9edc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_2202] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_9edc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_fe3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2202_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2202_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_f2f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_b924] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_f2f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l130_c7_f2f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_b924_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l126_c7_aa4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_aa4c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_86ff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_aa4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_16bc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_86ff_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_16bc;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_9b97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_9b97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_f2f0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_9b97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_f2f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c2_5cf9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c2_5cf9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c2_5cf9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output := tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_aa4c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_aa4c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_9b97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_9b97_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c2_5cf9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l112_DUPLICATE_0fb4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l112_DUPLICATE_0fb4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f073(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c2_5cf9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l112_DUPLICATE_0fb4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l112_DUPLICATE_0fb4_return_output;
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
