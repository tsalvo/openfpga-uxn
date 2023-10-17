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
-- Submodules: 38
entity jmi_0CLK_e573058b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_e573058b;
architecture arch of jmi_0CLK_e573058b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_856f]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_ab02]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_6b83]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_6b83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_6b83]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_6b83]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l112_c3_aba4[uxn_opcodes_h_l112_c3_aba4]
signal printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_ca19]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_d57f]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_d57f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_d57f]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_d57f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_db9a]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_eb47]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_eb47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_eb47]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_eb47]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_f385]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l122_c22_2448]
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l124_c11_6e45]
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l124_c7_f51e]
signal tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_f51e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l124_c7_f51e]
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_f51e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_554b]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_9fec]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_4746]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_4746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l127_c7_4746]
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_4746]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l128_c3_d20c]
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_3055]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_810f]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l132_c11_ca92]
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_45f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_45f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f15a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f
BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_6b83
tmp16_MUX_uxn_opcodes_h_l111_c2_6b83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83
result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output);

-- printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4
printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4 : entity work.printf_uxn_opcodes_h_l112_c3_aba4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19
BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_d57f
tmp16_MUX_uxn_opcodes_h_l116_c7_d57f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f
result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a
BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_eb47
tmp16_MUX_uxn_opcodes_h_l119_c7_eb47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47
result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_f385
CONST_SL_8_uxn_opcodes_h_l121_c3_f385 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left,
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right,
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45
BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output);

-- tmp16_MUX_uxn_opcodes_h_l124_c7_f51e
tmp16_MUX_uxn_opcodes_h_l124_c7_f51e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond,
tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue,
tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse,
tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e
result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec
BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_4746
tmp16_MUX_uxn_opcodes_h_l127_c7_4746 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746
result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c
BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left,
BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right,
BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92
BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output,
 tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output,
 BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l122_c3_3e7e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l125_c3_d05b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l130_c3_e934 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_4746_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l128_l120_DUPLICATE_581d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l107_l137_DUPLICATE_ceb4_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_db9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l122_c22_2448] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_left;
     BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output := BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l132_c11_ca92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_left;
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output := BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l128_l120_DUPLICATE_581d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l128_l120_DUPLICATE_581d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_554b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l124_c11_6e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_9fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_856f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output := result.is_opc_done;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l127_c7_4746] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_4746_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_ca19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_856f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_ca19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_db9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_6e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_9fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_ca92_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l122_c3_3e7e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2448_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l125_c3_d05b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_554b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l128_l120_DUPLICATE_581d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l128_l120_DUPLICATE_581d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_639e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_ba50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_4746_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue := VAR_result_u16_value_uxn_opcodes_h_l122_c3_3e7e;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l125_c3_d05b;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_45f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_ab02] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l128_c3_d20c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_left;
     BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output := BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_45f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l121_c3_f385] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_d20c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_f385_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_ab02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_45f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_45f9_return_output;
     -- printf_uxn_opcodes_h_l112_c3_aba4[uxn_opcodes_h_l112_c3_aba4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_aba4_uxn_opcodes_h_l112_c3_aba4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_4746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_4746] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_3055] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l127_c7_4746] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_3055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_4746_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_4746_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_4746_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l124_c7_f51e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_cond;
     tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output := tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_f51e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_f51e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_810f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l130_c3_e934 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_810f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue := VAR_result_u16_value_uxn_opcodes_h_l130_c3_e934;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_eb47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_eb47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l127_c7_4746] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_cond;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output := result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_eb47] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_4746_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_d57f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l124_c7_f51e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output := result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_d57f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_d57f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_f51e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_eb47] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_6b83] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_6b83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l111_c2_6b83] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_eb47_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_6b83_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_d57f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_d57f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_6b83] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l107_l137_DUPLICATE_ceb4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l107_l137_DUPLICATE_ceb4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f15a(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_6b83_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_6b83_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l107_l137_DUPLICATE_ceb4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l107_l137_DUPLICATE_ceb4_return_output;
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
