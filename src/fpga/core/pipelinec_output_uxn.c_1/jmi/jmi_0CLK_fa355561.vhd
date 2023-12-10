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
-- BIN_OP_EQ[uxn_opcodes_h_l108_c6_a255]
signal BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l108_c2_8864]
signal tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l108_c2_8864]
signal result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l108_c2_8864]
signal result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l108_c2_8864]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l115_c11_3756]
signal BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l115_c7_4bc5]
signal tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l115_c7_4bc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l115_c7_4bc5]
signal result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l115_c7_4bc5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l116_c22_c4bc]
signal BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l118_c11_48d7]
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l118_c7_f5ed]
signal tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l118_c7_f5ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l118_c7_f5ed]
signal result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l118_c7_f5ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l120_c3_ee1d]
signal CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l122_c11_9aaa]
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l122_c7_0d70]
signal tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_0d70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l122_c7_0d70]
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_0d70]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l123_c3_2c1e]
signal BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c23_7a61]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c23_448e]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_007b]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_8e55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_8e55]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255
BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left,
BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right,
BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output);

-- tmp16_MUX_uxn_opcodes_h_l108_c2_8864
tmp16_MUX_uxn_opcodes_h_l108_c2_8864 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond,
tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue,
tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse,
tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864
result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864
result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond,
result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864
result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756
BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left,
BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right,
BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output);

-- tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5
tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond,
tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue,
tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse,
tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5
result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5
result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond,
result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5
result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc
BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left,
BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right,
BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7
BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left,
BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right,
BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed
tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond,
tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed
result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output);

-- CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d
CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x,
CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa
BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l122_c7_0d70
tmp16_MUX_uxn_opcodes_h_l122_c7_0d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond,
tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue,
tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse,
tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70
result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e
BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left,
BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right,
BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b
BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output,
 tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output,
 tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output,
 CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output,
 tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output,
 BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l116_c3_f81d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l125_c3_cf14 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l119_l123_DUPLICATE_befb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l122_l118_DUPLICATE_3d1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l132_l104_DUPLICATE_a9c5_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l116_c22_c4bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l108_c6_a255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_left;
     BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output := BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l122_c11_9aaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l122_l118_DUPLICATE_3d1c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l122_l118_DUPLICATE_3d1c_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l119_l123_DUPLICATE_befb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l119_l123_DUPLICATE_befb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l118_c11_48d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_007b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l115_c11_3756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_left;
     BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output := BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l108_c6_a255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l115_c11_3756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_48d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_9aaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_007b_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l116_c3_f81d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l116_c22_c4bc_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l119_l123_DUPLICATE_befb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l119_l123_DUPLICATE_befb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l122_l118_DUPLICATE_3d1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l122_l118_DUPLICATE_3d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l122_l115_l127_l118_DUPLICATE_7017_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l115_l127_l118_l108_DUPLICATE_151f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l116_c3_f81d;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_8e55] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l120_c3_ee1d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output := CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l123_c3_2c1e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_left;
     BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output := BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_8e55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right := VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l123_c3_2c1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l120_c3_ee1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_8e55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_8e55_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_0d70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l122_c7_0d70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_cond;
     tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output := tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c23_7a61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_0d70] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_7a61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c23_448e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l118_c7_f5ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l118_c7_f5ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l118_c7_f5ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_cond;
     tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output := tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l125_c3_cf14 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c23_448e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue := VAR_result_u16_value_uxn_opcodes_h_l125_c3_cf14;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l115_c7_4bc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l122_c7_0d70] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_cond;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output := result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l115_c7_4bc5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l115_c7_4bc5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_cond;
     tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output := tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l122_c7_0d70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l108_c2_8864] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_cond;
     tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iftrue;
     tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output := tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l108_c2_8864] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l118_c7_f5ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l108_c2_8864] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l118_c7_f5ed_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l108_c2_8864_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l115_c7_4bc5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output := result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l115_c7_4bc5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l108_c2_8864] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_cond;
     result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output := result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l132_l104_DUPLICATE_a9c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l132_l104_DUPLICATE_a9c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f15a(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l108_c2_8864_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l108_c2_8864_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l132_l104_DUPLICATE_a9c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f15a_uxn_opcodes_h_l132_l104_DUPLICATE_a9c5_return_output;
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
