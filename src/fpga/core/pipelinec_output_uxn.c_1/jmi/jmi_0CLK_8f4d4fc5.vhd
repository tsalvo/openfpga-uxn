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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_f927]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_42fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_40ed]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_40ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_40ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_40ed]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l112_c3_9458[uxn_opcodes_h_l112_c3_9458]
signal printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_233c]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_41d9]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_41d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_41d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_41d9]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_b0ed]
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_419d]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_f200]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_f200]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_f200]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_f200]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_44c8]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_00c1]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_94fd]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_94fd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_94fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_94fd]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l124_c3_aef0]
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_656b]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_0e1a]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_ea85]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_06ec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_06ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927
BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_40ed
tmp16_MUX_uxn_opcodes_h_l111_c2_40ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed
result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output);

-- printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458
printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458 : entity work.printf_uxn_opcodes_h_l112_c3_9458_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c
BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_41d9
tmp16_MUX_uxn_opcodes_h_l116_c7_41d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9
result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d
BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_f200
tmp16_MUX_uxn_opcodes_h_l119_c7_f200 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200
result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_44c8
CONST_SL_8_uxn_opcodes_h_l121_c3_44c8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1
BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_94fd
tmp16_MUX_uxn_opcodes_h_l123_c7_94fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd
result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0
BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left,
BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right,
BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85
BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l117_c3_16ca : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l126_c3_dc89 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_499c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l123_l119_DUPLICATE_7732_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_af7b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_419d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_233c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_ea85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_f927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_00c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l123_l119_DUPLICATE_7732 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l123_l119_DUPLICATE_7732_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_499c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_499c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_b0ed] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_left;
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output := BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_f927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_233c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_419d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_00c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_ea85_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l117_c3_16ca := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_b0ed_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_499c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_499c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l123_l119_DUPLICATE_7732_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l123_l119_DUPLICATE_7732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l116_l128_l119_DUPLICATE_7a56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_a524_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue := VAR_result_u16_value_uxn_opcodes_h_l117_c3_16ca;
     -- CONST_SL_8[uxn_opcodes_h_l121_c3_44c8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_42fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_06ec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l124_c3_aef0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_left;
     BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output := BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_06ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_aef0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_44c8_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_42fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_06ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_06ec_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_94fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_94fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;

     -- printf_uxn_opcodes_h_l112_c3_9458[uxn_opcodes_h_l112_c3_9458] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_9458_uxn_opcodes_h_l112_c3_9458_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_94fd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_656b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_656b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_f200] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_0e1a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_f200] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_f200] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l126_c3_dc89 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_0e1a_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_f200_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_f200_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_f200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l126_c3_dc89;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_94fd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_41d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_41d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_41d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_94fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l111_c2_40ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_40ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_40ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_f200] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_f200_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_40ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_41d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_41d9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_40ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_af7b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_af7b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f073(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_40ed_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_40ed_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_af7b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f073_uxn_opcodes_h_l133_l107_DUPLICATE_af7b_return_output;
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
