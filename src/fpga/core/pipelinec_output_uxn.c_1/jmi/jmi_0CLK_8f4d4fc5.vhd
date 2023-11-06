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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_bd4c]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_f309]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_f222]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l111_c2_f222]
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_f222]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_f222]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l112_c3_68aa[uxn_opcodes_h_l112_c3_68aa]
signal printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_db90]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_fbcf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l116_c7_fbcf]
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_fbcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_fbcf]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_916f]
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_04a6]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_a84e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l119_c7_a84e]
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_a84e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_a84e]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_65cc]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_2558]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_629d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_629d]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_629d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_629d]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l124_c3_6a0e]
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_f783]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_c5da]
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_446b]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_7257]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_7257]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c
BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222
result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_f222
tmp16_MUX_uxn_opcodes_h_l111_c2_f222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output);

-- printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa
printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa : entity work.printf_uxn_opcodes_h_l112_c3_68aa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90
BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf
result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf
tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right,
BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6
BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e
result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_a84e
tmp16_MUX_uxn_opcodes_h_l119_c7_a84e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_65cc
CONST_SL_8_uxn_opcodes_h_l121_c3_65cc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558
BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d
result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_629d
tmp16_MUX_uxn_opcodes_h_l123_c7_629d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e
BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left,
BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right,
BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right,
BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b
BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l117_c3_d790 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l126_c3_5c86 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_6d8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_5f5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l133_l107_DUPLICATE_f8e8_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l117_c22_916f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_5f5c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_5f5c_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_04a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_446b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_2558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_bd4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_6d8f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_6d8f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_db90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_bd4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_db90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_04a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_2558_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_446b_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l117_c3_d790 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l117_c22_916f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_6d8f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l124_DUPLICATE_6d8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_5f5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l119_l123_DUPLICATE_5f5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l116_l128_l119_l123_DUPLICATE_a9fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l116_l128_l119_l111_DUPLICATE_5a10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue := VAR_result_u16_value_uxn_opcodes_h_l117_c3_d790;
     -- CONST_SL_8[uxn_opcodes_h_l121_c3_65cc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_7257] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l124_c3_6a0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_left;
     BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output := BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_7257] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_f309] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l124_c3_6a0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_65cc_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_7257_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_7257_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_629d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output;

     -- printf_uxn_opcodes_h_l112_c3_68aa[uxn_opcodes_h_l112_c3_68aa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_68aa_uxn_opcodes_h_l112_c3_68aa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_629d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_f783] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_629d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_f783_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_629d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_629d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_629d_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l126_c23_c5da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_a84e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_a84e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_a84e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l126_c3_5c86 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l126_c23_c5da_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l126_c3_5c86;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_fbcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_fbcf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_fbcf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_629d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_629d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l111_c2_f222] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_f222] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l119_c7_a84e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output := result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_f222] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l119_c7_a84e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_f222_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l116_c7_fbcf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output := result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l116_c7_fbcf_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l111_c2_f222] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_cond;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output := result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l133_l107_DUPLICATE_f8e8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l133_l107_DUPLICATE_f8e8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b848(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l111_c2_f222_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_f222_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l133_l107_DUPLICATE_f8e8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b848_uxn_opcodes_h_l133_l107_DUPLICATE_f8e8_return_output;
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
