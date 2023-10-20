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
-- Submodules: 36
entity jmi_0CLK_23e8fd15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_23e8fd15;
architecture arch of jmi_0CLK_23e8fd15 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l114_c6_2081]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c2_b161]
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c2_b161]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c2_b161]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l114_c2_b161]
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_7373]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_b1e1]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_b1e1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_b1e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_b1e1]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l122_c11_5b12]
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l122_c7_c873]
signal tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_c873]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_c873]
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l122_c7_c873]
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l124_c3_2d05]
signal CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_f676]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_3999]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_7a04]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_7a04]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_7a04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l127_c7_7a04]
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l128_c22_c998]
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_9d53]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_e08a]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_e08a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_e08a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_e08a]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_5eb4]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9215]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_812f]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l135_c11_67c6]
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_2143]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_2143]
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c2_b161
tmp16_MUX_uxn_opcodes_h_l114_c2_b161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond,
tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373
BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1
tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1
result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12
BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l122_c7_c873
tmp16_MUX_uxn_opcodes_h_l122_c7_c873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond,
tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue,
tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse,
tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873
result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output);

-- CONST_SL_8_uxn_opcodes_h_l124_c3_2d05
CONST_SL_8_uxn_opcodes_h_l124_c3_2d05 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x,
CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999
BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_7a04
tmp16_MUX_uxn_opcodes_h_l127_c7_7a04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04
result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left,
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right,
BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53
BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_e08a
tmp16_MUX_uxn_opcodes_h_l130_c7_e08a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a
result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4
BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6
BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right,
BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output,
 tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output,
 CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l125_c3_1885 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l128_c3_9436 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_fd93 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_e08a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l123_DUPLICATE_1248_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l110_DUPLICATE_c8a0_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c22_f676] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_3999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l128_c22_c998] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_left;
     BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output := BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l135_c11_67c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_9d53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l122_c11_5b12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_left;
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output := BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output := result.is_pc_updated;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l130_c7_e08a] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_e08a_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l123_DUPLICATE_1248 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l123_DUPLICATE_1248_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c6_2081] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_7373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c6_2081_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_7373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_5b12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_3999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_9d53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l135_c11_67c6_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l125_c3_1885 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c22_f676_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l128_c3_9436 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c22_c998_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l123_DUPLICATE_1248_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l123_DUPLICATE_1248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l135_l130_l127_l122_l119_DUPLICATE_5dad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l135_l127_l122_l119_l114_DUPLICATE_3969_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_c7_e08a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue := VAR_result_u16_value_uxn_opcodes_h_l125_c3_1885;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue := VAR_result_u16_value_uxn_opcodes_h_l128_c3_9436;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l135_c7_2143] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l135_c7_2143] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l124_c3_2d05] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x <= VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output := CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_5eb4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_5eb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l124_c3_2d05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l135_c7_2143_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l135_c7_2143_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9215] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_e08a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_e08a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l130_c7_e08a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_7a04] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l127_c7_7a04] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_7a04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_812f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_fd93 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_812f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_fd93;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_c873] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_e08a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_c873] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l122_c7_c873] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_cond;
     tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iftrue;
     tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output := tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_c873_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_c873_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_e08a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_c873_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_b1e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_b1e1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l127_c7_7a04] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_cond;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output := result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l127_c7_7a04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c2_b161] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c2_b161] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c2_b161] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output := tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l122_c7_c873] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_cond;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output := result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_c873_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l114_c2_b161_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_b1e1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_b1e1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l114_c2_b161] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_cond;
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output := result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l110_DUPLICATE_c8a0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l110_DUPLICATE_c8a0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f073(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c2_b161_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l114_c2_b161_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l110_DUPLICATE_c8a0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l140_l110_DUPLICATE_c8a0_return_output;
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
