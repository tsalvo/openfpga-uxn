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
-- Submodules: 40
entity jmi_0CLK_17cc5023 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_17cc5023;
architecture arch of jmi_0CLK_17cc5023 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_50af]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_165a]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l111_c2_165a]
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l111_c2_165a]
signal result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_165a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_165a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_6bec]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_8465]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l116_c7_8465]
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l116_c7_8465]
signal result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_8465]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_8465]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_1602]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_20aa]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_20aa]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c7_20aa]
signal result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_20aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_20aa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_de2b]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l122_c21_e78d]
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l124_c11_0895]
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l124_c7_e612]
signal tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_e612]
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l124_c7_e612]
signal result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_e612]
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_e612]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c21_43ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_8a55]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_80df]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l127_c7_80df]
signal result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_80df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_80df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l128_c3_5c0d]
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_aad3]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_85fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l132_c11_eeb1]
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_d0a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_d0a8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_309f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_pc_updated := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af
BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_165a
tmp16_MUX_uxn_opcodes_h_l111_c2_165a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l111_c2_165a
result_pc_MUX_uxn_opcodes_h_l111_c2_165a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond,
result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue,
result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse,
result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec
BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_8465
tmp16_MUX_uxn_opcodes_h_l116_c7_8465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output);

-- result_pc_MUX_uxn_opcodes_h_l116_c7_8465
result_pc_MUX_uxn_opcodes_h_l116_c7_8465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond,
result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue,
result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse,
result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602
BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_20aa
tmp16_MUX_uxn_opcodes_h_l119_c7_20aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c7_20aa
result_pc_MUX_uxn_opcodes_h_l119_c7_20aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond,
result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_de2b
CONST_SL_8_uxn_opcodes_h_l121_c3_de2b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left,
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right,
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895
BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output);

-- tmp16_MUX_uxn_opcodes_h_l124_c7_e612
tmp16_MUX_uxn_opcodes_h_l124_c7_e612 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond,
tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue,
tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse,
tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output);

-- result_pc_MUX_uxn_opcodes_h_l124_c7_e612
result_pc_MUX_uxn_opcodes_h_l124_c7_e612 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond,
result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue,
result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse,
result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_80df
tmp16_MUX_uxn_opcodes_h_l127_c7_80df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output);

-- result_pc_MUX_uxn_opcodes_h_l127_c7_80df
result_pc_MUX_uxn_opcodes_h_l127_c7_80df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond,
result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue,
result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse,
result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d
BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left,
BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right,
BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1
BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
 result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output,
 result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output,
 tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output,
 result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output,
 result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output,
 BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l122_c3_bd40 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l125_c3_3a9e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_e612_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l130_c3_b863 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_e646_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_309f_uxn_opcodes_h_l107_l137_DUPLICATE_9eb5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_1602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_8a55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_6bec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_e612_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_e646 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_e646_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_50af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l124_c11_0895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_left;
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output := BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l122_c21_e78d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l132_c11_eeb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c21_43ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_50af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_1602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_0895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_8a55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_eeb1_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l122_c3_bd40 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_e78d_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l125_c3_3a9e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_43ee_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_e646_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_e646_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l116_l111_l127_l124_DUPLICATE_5178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l119_l116_l132_l127_l124_DUPLICATE_0d94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l116_l111_l132_l124_DUPLICATE_877c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_e612_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l122_c3_bd40;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l125_c3_3a9e;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_d0a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l128_c3_5c0d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_left;
     BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output := BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_d0a8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l121_c3_de2b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output := result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_5c0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_de2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_d0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_e612_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_80df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_aad3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_20aa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_80df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l127_c7_80df] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_aad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_80df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_80df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_80df_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_85fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_cond;
     tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iftrue;
     tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output := tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l116_c7_8465] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output := result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l130_c3_b863 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_85fa_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_e612_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_e612_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_8465_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_e612_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue := VAR_result_pc_uxn_opcodes_h_l130_c3_b863;
     -- result_pc_MUX[uxn_opcodes_h_l127_c7_80df] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_cond;
     result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iftrue;
     result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output := result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_20aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_20aa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l111_c2_165a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_20aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_80df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_8465] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l124_c7_e612] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_cond;
     result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iftrue;
     result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output := result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_8465] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_8465] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_8465_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_8465_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_e612_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_8465_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l111_c2_165a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_165a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l119_c7_20aa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output := result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_165a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_20aa_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_165a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l116_c7_8465] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_cond;
     result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iftrue;
     result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output := result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_8465_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l111_c2_165a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_cond;
     result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output := result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_309f_uxn_opcodes_h_l107_l137_DUPLICATE_9eb5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_309f_uxn_opcodes_h_l107_l137_DUPLICATE_9eb5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_309f(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_165a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_165a_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_309f_uxn_opcodes_h_l107_l137_DUPLICATE_9eb5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_309f_uxn_opcodes_h_l107_l137_DUPLICATE_9eb5_return_output;
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
