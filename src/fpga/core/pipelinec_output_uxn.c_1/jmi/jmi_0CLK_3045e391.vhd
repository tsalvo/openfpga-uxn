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
-- BIN_OP_EQ[uxn_opcodes_h_l111_c6_cce7]
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_f597]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l111_c2_dfdd]
signal tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_dfdd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l111_c2_dfdd]
signal result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_dfdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l111_c2_dfdd]
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l112_c3_750c[uxn_opcodes_h_l112_c3_750c]
signal printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l116_c11_b1e4]
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l116_c7_e0b3]
signal tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_e0b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l116_c7_e0b3]
signal result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_e0b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l116_c7_e0b3]
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l119_c11_8d09]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c7_c26a]
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_c26a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c7_c26a]
signal result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_c26a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_c26a]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l121_c3_c099]
signal CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l122_c21_64c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l124_c11_1f4f]
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l124_c7_0bf5]
signal tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_0bf5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l124_c7_0bf5]
signal result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_0bf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_0bf5]
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l125_c21_512f]
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l127_c11_c96c]
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l127_c7_adab]
signal tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_adab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l127_c7_adab]
signal result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_adab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l128_c3_42b0]
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_8f16]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_92cb]
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l132_c11_5704]
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_f13d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_f13d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.ram_addr := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7
BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right,
BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output);

-- tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd
tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond,
tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue,
tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse,
tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd
result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond,
result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue,
result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse,
result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

-- printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c
printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c : entity work.printf_uxn_opcodes_h_l112_c3_750c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4
BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right,
BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3
tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond,
tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3
result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond,
result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue,
result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse,
result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09
BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c7_c26a
tmp16_MUX_uxn_opcodes_h_l119_c7_c26a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond,
tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c7_c26a
result_pc_MUX_uxn_opcodes_h_l119_c7_c26a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond,
result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l121_c3_c099
CONST_SL_8_uxn_opcodes_h_l121_c3_c099 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x,
CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f
BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right,
BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5
tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond,
tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue,
tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse,
tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5
result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond,
result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue,
result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse,
result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left,
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right,
BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c
BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right,
BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l127_c7_adab
tmp16_MUX_uxn_opcodes_h_l127_c7_adab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond,
tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue,
tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse,
tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output);

-- result_pc_MUX_uxn_opcodes_h_l127_c7_adab
result_pc_MUX_uxn_opcodes_h_l127_c7_adab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond,
result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue,
result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse,
result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0
BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left,
BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right,
BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right,
BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704
BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right,
BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output,
 tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
 result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output,
 result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output,
 CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output,
 tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output,
 result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output,
 tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output,
 result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l122_c3_0dd7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l125_c3_d4d2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_0bf5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l130_c3_b53c : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_46d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3_uxn_opcodes_h_l137_l107_DUPLICATE_ca6d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c11_8d09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l122_c21_64c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l127_c11_c96c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_left;
     BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output := BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_0bf5_return_output := result.ram_addr;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l124_c11_1f4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l116_c11_b1e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l111_c6_cce7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_left;
     BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output := BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l125_c21_512f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l132_c11_5704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_left;
     BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output := BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_46d9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_46d9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l111_c6_cce7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l116_c11_b1e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c11_8d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l124_c11_1f4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l127_c11_c96c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l132_c11_5704_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l122_c3_0dd7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l122_c21_64c8_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l125_c3_d4d2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l125_c21_512f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_46d9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l120_l128_DUPLICATE_46d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l127_l124_l119_l116_l111_DUPLICATE_58ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l132_l127_l124_l119_l116_DUPLICATE_98b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l132_l124_l119_l116_l111_DUPLICATE_dfdf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l124_c7_0bf5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l122_c3_0dd7;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l125_c3_d4d2;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l132_c7_f13d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l128_c3_42b0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_left;
     BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output := BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l121_c3_c099] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x <= VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output := CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l111_c1_f597] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l132_c7_f13d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l128_c3_42b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l121_c3_c099_return_output;
     VAR_printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l111_c1_f597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l132_c7_f13d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l132_c7_f13d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l127_c7_adab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_cond;
     tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output := tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_8f16] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l127_c7_adab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output;

     -- printf_uxn_opcodes_h_l112_c3_750c[uxn_opcodes_h_l112_c3_750c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l112_c3_750c_uxn_opcodes_h_l112_c3_750c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l127_c7_adab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c7_c26a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_8f16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l127_c7_adab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l127_c7_adab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l127_c7_adab_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l116_c7_e0b3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l130_c16_92cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_cond;
     tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output := tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l130_c3_b53c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l130_c16_92cb_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue := VAR_result_pc_uxn_opcodes_h_l130_c3_b53c;
     -- result_ram_addr_MUX[uxn_opcodes_h_l111_c2_dfdd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c7_c26a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l127_c7_adab] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_cond;
     result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iftrue;
     result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output := result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c7_c26a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c7_c26a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output := tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l127_c7_adab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l124_c7_0bf5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_cond;
     result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output := result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l116_c7_e0b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_cond;
     tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output := tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l116_c7_e0b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l116_c7_e0b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l124_c7_0bf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c7_c26a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output := result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l111_c2_dfdd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_cond;
     tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output := tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l111_c2_dfdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l111_c2_dfdd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l119_c7_c26a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l116_c7_e0b3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_cond;
     result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output := result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l116_c7_e0b3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l111_c2_dfdd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_cond;
     result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output := result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3_uxn_opcodes_h_l137_l107_DUPLICATE_ca6d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3_uxn_opcodes_h_l137_l107_DUPLICATE_ca6d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l111_c2_dfdd_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3_uxn_opcodes_h_l137_l107_DUPLICATE_ca6d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fcd3_uxn_opcodes_h_l137_l107_DUPLICATE_ca6d_return_output;
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
