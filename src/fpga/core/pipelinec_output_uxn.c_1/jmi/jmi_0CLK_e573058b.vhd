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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_87be]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_53b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_3cb5]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_3cb5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_3cb5]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_3cb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l112_c3_ef44[uxn_opcodes_h_l112_c3_ef44]
signal printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_d4f1]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_abbb]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_abbb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_abbb]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_abbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_b0ee]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_8b2e]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_8b2e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_8b2e]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_8b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_2f90]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l122_c22_2992]
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l124_c11_33b9]
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l124_c7_44c7]
signal tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_44c7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l124_c7_44c7]
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_44c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_5da1]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_5f75]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_ebbf]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_ebbf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l127_c7_ebbf]
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_ebbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l128_c3_206c]
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_55c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_f0f9]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l132_c11_cc97]
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_5dc8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_5dc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be
BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5
tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5
result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output);

-- printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44
printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44 : entity work.printf_uxn_opcodes_h_l112_c3_ef44_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1
BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_abbb
tmp16_MUX_uxn_opcodes_h_l116_c7_abbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb
result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee
BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e
tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e
result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_2f90
CONST_SL_8_uxn_opcodes_h_l121_c3_2f90 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left,
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right,
BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9
BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l124_c7_44c7
tmp16_MUX_uxn_opcodes_h_l124_c7_44c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond,
tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7
result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75
BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf
tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf
result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l128_c3_206c
BIN_OP_OR_uxn_opcodes_h_l128_c3_206c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left,
BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right,
BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97
BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output,
 tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l122_c3_760b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l125_c3_41f1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l130_c3_428c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_ebbf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_7c93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l137_l107_DUPLICATE_4055_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_d4f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l122_c22_2992] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_left;
     BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output := BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l132_c11_cc97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_left;
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output := BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l127_c7_ebbf] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_ebbf_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_5da1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_5f75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_87be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_b0ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l124_c11_33b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_7c93 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_7c93_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_87be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_d4f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_b0ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_33b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_5f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_cc97_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l122_c3_760b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c22_2992_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l125_c3_41f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_5da1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_7c93_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_7c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l124_l119_l116_l132_l127_DUPLICATE_62aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l124_l119_l116_l111_l132_DUPLICATE_2586_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l127_c7_ebbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l122_c3_760b;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l125_c3_41f1;
     -- CONST_SL_8[uxn_opcodes_h_l121_c3_2f90] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_53b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_5dc8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l128_c3_206c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_left;
     BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output := BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_5dc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_206c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_2f90_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_53b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_5dc8_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_55c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l127_c7_ebbf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_ebbf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_ebbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;

     -- printf_uxn_opcodes_h_l112_c3_ef44[uxn_opcodes_h_l112_c3_ef44] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_ef44_uxn_opcodes_h_l112_c3_ef44_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_55c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_44c7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_44c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c23_f0f9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l124_c7_44c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_cond;
     tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output := tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l130_c3_428c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c23_f0f9_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue := VAR_result_u16_value_uxn_opcodes_h_l130_c3_428c;
     -- result_u16_value_MUX[uxn_opcodes_h_l127_c7_ebbf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output := result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_8b2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_8b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_8b2e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_ebbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l116_c7_abbb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_abbb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l124_c7_44c7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output := result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_abbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l124_c7_44c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_8b2e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_3cb5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_3cb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l111_c2_3cb5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_8b2e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_abbb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_abbb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_3cb5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l137_l107_DUPLICATE_4055 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l137_l107_DUPLICATE_4055_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b848(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_3cb5_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l137_l107_DUPLICATE_4055_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l137_l107_DUPLICATE_4055_return_output;
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
