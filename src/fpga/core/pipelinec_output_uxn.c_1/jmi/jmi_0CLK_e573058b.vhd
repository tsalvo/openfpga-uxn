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
-- BIN_OP_EQ[uxn_opcodes_h_l114_c6_2464]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l114_c1_c2d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c2_b9bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l114_c2_b9bb]
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c2_b9bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c2_b9bb]
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l115_c3_e3f9[uxn_opcodes_h_l115_c3_e3f9]
signal printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_60d5]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_22d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_22d9]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_22d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_22d9]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l122_c11_e194]
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_a100]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l122_c7_a100]
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_a100]
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l122_c7_a100]
signal tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l124_c3_42ae]
signal CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_80e7]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_8366]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_d93b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l127_c7_d93b]
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_d93b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_d93b]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l128_c22_72fc]
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_3dd2]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_3be3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_3be3]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_3be3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_3be3]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_4816]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_f9ba]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_a560]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l135_c11_d7c7]
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_3456]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_3456]
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb
tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond,
tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output);

-- printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9
printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9 : entity work.printf_uxn_opcodes_h_l115_c3_e3f9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5
BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9
result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_22d9
tmp16_MUX_uxn_opcodes_h_l119_c7_22d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194
BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100
result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output);

-- tmp16_MUX_uxn_opcodes_h_l122_c7_a100
tmp16_MUX_uxn_opcodes_h_l122_c7_a100 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond,
tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue,
tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse,
tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output);

-- CONST_SL_8_uxn_opcodes_h_l124_c3_42ae
CONST_SL_8_uxn_opcodes_h_l124_c3_42ae : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x,
CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b
result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_d93b
tmp16_MUX_uxn_opcodes_h_l127_c7_d93b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left,
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right,
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2
BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_3be3
tmp16_MUX_uxn_opcodes_h_l130_c7_3be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_4816
BIN_OP_OR_uxn_opcodes_h_l131_c3_4816 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7
BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output,
 tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output,
 CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l125_c3_f1ca : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l128_c3_0d0d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_745d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_3be3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l123_l131_DUPLICATE_a942_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l140_l110_DUPLICATE_c4cc_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l123_l131_DUPLICATE_a942 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l123_l131_DUPLICATE_a942_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l128_c22_72fc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_80e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_8366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c6_2464] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_3dd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l135_c11_d7c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_60d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output := result.is_pc_updated;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l130_c7_3be3] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_3be3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l122_c11_e194] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_left;
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output := BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_60d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_e194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_3dd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_d7c7_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l125_c3_f1ca := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_80e7_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l128_c3_0d0d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_72fc_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l123_l131_DUPLICATE_a942_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l123_l131_DUPLICATE_a942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l135_l130_l127_l122_DUPLICATE_862c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l114_l135_l127_l122_DUPLICATE_728d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_3be3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue := VAR_result_u16_value_uxn_opcodes_h_l125_c3_f1ca;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l128_c3_0d0d;
     -- CONST_SL_8[uxn_opcodes_h_l124_c3_42ae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x <= VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output := CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_3456] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_3456] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l114_c1_c2d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_4816] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_42ae_return_output;
     VAR_printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l114_c1_c2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_3456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_3456_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l130_c7_3be3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_3be3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_3be3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;

     -- printf_uxn_opcodes_h_l115_c3_e3f9[uxn_opcodes_h_l115_c3_e3f9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l115_c3_e3f9_uxn_opcodes_h_l115_c3_e3f9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_f9ba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_f9ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_a560] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_d93b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l127_c7_d93b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_d93b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_745d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_a560_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_745d;
     -- tmp16_MUX[uxn_opcodes_h_l122_c7_a100] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_cond;
     tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iftrue;
     tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output := tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_3be3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_a100] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_a100] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_a100_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_a100_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3be3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_a100_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_22d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_22d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l127_c7_d93b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output := result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_22d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_d93b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c2_b9bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l122_c7_a100] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_cond;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output := result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c2_b9bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c2_b9bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output := tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_a100_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_22d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_22d9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l114_c2_b9bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l140_l110_DUPLICATE_c4cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l140_l110_DUPLICATE_c4cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b848(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b9bb_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l140_l110_DUPLICATE_c4cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l140_l110_DUPLICATE_c4cc_return_output;
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
