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
-- Submodules: 42
entity jmi_0CLK_3045e391 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_3045e391;
architecture arch of jmi_0CLK_3045e391 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l109_c6_4334]
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l109_c1_7404]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l109_c2_42ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l109_c2_42ca]
signal result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l109_c2_42ca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l109_c2_42ca]
signal result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l109_c2_42ca]
signal tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l110_c3_7234[uxn_opcodes_h_l110_c3_7234]
signal printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l114_c11_f107]
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_ddb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_ddb0]
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_ddb0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l114_c7_ddb0]
signal result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l114_c7_ddb0]
signal tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l117_c11_e47d]
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l117_c7_f62a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l117_c7_f62a]
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c7_f62a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l117_c7_f62a]
signal result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l117_c7_f62a]
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l119_c3_9429]
signal CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l120_c21_97bc]
signal BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l122_c11_7dde]
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_fcd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l122_c7_fcd3]
signal result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_fcd3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l122_c7_fcd3]
signal result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l122_c7_fcd3]
signal tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l123_c21_93eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l125_c11_cc67]
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_859c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_859c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l125_c7_859c]
signal result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l125_c7_859c]
signal tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l126_c3_a895]
signal BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l128_c16_16c6]
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l128_c16_a3bb]
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_0d2c]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_aa05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_aa05]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.pc := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334
BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left,
BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right,
BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca
result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

-- result_pc_MUX_uxn_opcodes_h_l109_c2_42ca
result_pc_MUX_uxn_opcodes_h_l109_c2_42ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond,
result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue,
result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse,
result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l109_c2_42ca
tmp16_MUX_uxn_opcodes_h_l109_c2_42ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond,
tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

-- printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234
printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234 : entity work.printf_uxn_opcodes_h_l110_c3_7234_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107
BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right,
BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0
result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond,
result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue,
result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse,
result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0
tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond,
tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue,
tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse,
tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d
BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left,
BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right,
BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a
result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l117_c7_f62a
result_pc_MUX_uxn_opcodes_h_l117_c7_f62a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond,
result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue,
result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse,
result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l117_c7_f62a
tmp16_MUX_uxn_opcodes_h_l117_c7_f62a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond,
tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue,
tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse,
tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l119_c3_9429
CONST_SL_8_uxn_opcodes_h_l119_c3_9429 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x,
CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc
BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left,
BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right,
BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde
BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right,
BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3
result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3
result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond,
result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue,
result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse,
result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3
tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond,
tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue,
tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse,
tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb
BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67
BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l125_c7_859c
result_pc_MUX_uxn_opcodes_h_l125_c7_859c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond,
result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue,
result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse,
result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l125_c7_859c
tmp16_MUX_uxn_opcodes_h_l125_c7_859c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond,
tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue,
tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse,
tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l126_c3_a895
BIN_OP_OR_uxn_opcodes_h_l126_c3_a895 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left,
BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right,
BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left,
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right,
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left,
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right,
BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c
BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
 result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output,
 result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output,
 tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output,
 result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output,
 tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output,
 CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output,
 result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output,
 tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output,
 result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output,
 tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l120_c3_7a99 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l123_c3_de0d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l122_c7_fcd3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l128_c3_8d25 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l126_DUPLICATE_4acc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af29_uxn_opcodes_h_l135_l105_DUPLICATE_15bc_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l123_c21_93eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l109_c6_4334] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_left;
     BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output := BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l126_DUPLICATE_4acc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l126_DUPLICATE_4acc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l122_c11_7dde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_left;
     BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output := BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l120_c21_97bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l114_c11_f107] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_left;
     BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output := BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l122_c7_fcd3_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l117_c11_e47d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_left;
     BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output := BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_0d2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l125_c11_cc67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_left;
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output := BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l109_c6_4334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l114_c11_f107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c11_e47d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l122_c11_7dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_cc67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_0d2c_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l120_c3_7a99 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l120_c21_97bc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l123_c3_de0d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l123_c21_93eb_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l126_DUPLICATE_4acc_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l118_l126_DUPLICATE_4acc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l122_l117_l114_l109_DUPLICATE_acf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l125_l122_l117_l114_DUPLICATE_c9b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l122_l117_l114_l109_DUPLICATE_5db9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l122_c7_fcd3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l120_c3_7a99;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l123_c3_de0d;
     -- BIN_OP_OR[uxn_opcodes_h_l126_c3_a895] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_left;
     BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output := BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_aa05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_aa05] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l119_c3_9429] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x <= VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output := CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l109_c1_7404] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l126_c3_a895_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l119_c3_9429_return_output;
     VAR_printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l109_c1_7404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_aa05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_aa05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_859c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l128_c16_16c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output;

     -- printf_uxn_opcodes_h_l110_c3_7234[uxn_opcodes_h_l110_c3_7234] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l110_c3_7234_uxn_opcodes_h_l110_c3_7234_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l125_c7_859c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_cond;
     tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output := tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l117_c7_f62a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_859c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_16c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_859c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_859c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_859c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l114_c7_ddb0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_cond;
     tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output := tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l128_c16_a3bb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l128_c3_8d25 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l128_c16_a3bb_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue := VAR_result_pc_uxn_opcodes_h_l128_c3_8d25;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c7_f62a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l117_c7_f62a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l109_c2_42ca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l125_c7_859c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_cond;
     result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output := result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l117_c7_f62a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_cond;
     tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output := tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_859c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l114_c7_ddb0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l114_c7_ddb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l114_c7_ddb0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_cond;
     tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output := tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l122_c7_fcd3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_cond;
     result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output := result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l122_c7_fcd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l109_c2_42ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_cond;
     tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output := tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l117_c7_f62a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_cond;
     result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output := result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l109_c2_42ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l109_c2_42ca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l117_c7_f62a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l114_c7_ddb0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_cond;
     result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output := result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l114_c7_ddb0_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l109_c2_42ca] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_cond;
     result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iftrue;
     result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output := result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af29_uxn_opcodes_h_l135_l105_DUPLICATE_15bc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af29_uxn_opcodes_h_l135_l105_DUPLICATE_15bc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l109_c2_42ca_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l109_c2_42ca_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af29_uxn_opcodes_h_l135_l105_DUPLICATE_15bc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af29_uxn_opcodes_h_l135_l105_DUPLICATE_15bc_return_output;
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
