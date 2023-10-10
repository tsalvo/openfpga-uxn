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
-- BIN_OP_EQ[uxn_opcodes_h_l113_c6_2393]
signal BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l113_c1_1725]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l113_c2_12c3]
signal result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l113_c2_12c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l113_c2_12c3]
signal result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l113_c2_12c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l113_c2_12c3]
signal tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l114_c3_fd4e[uxn_opcodes_h_l114_c3_fd4e]
signal printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l118_c11_b772]
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l118_c7_b80f]
signal result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l118_c7_b80f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l118_c7_b80f]
signal result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l118_c7_b80f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l118_c7_b80f]
signal tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l121_c11_731b]
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l121_c7_70a4]
signal result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_70a4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l121_c7_70a4]
signal result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_70a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l121_c7_70a4]
signal tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l123_c3_fc21]
signal CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c21_6043]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_e8cf]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l126_c7_d97a]
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_d97a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l126_c7_d97a]
signal result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_d97a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_d97a]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l127_c21_09fb]
signal BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l129_c11_de25]
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l129_c7_cb85]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l129_c7_cb85]
signal result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l129_c7_cb85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l129_c7_cb85]
signal tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l130_c3_f13a]
signal BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l132_c16_eddf]
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l132_c16_e6b1]
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l134_c11_a4d5]
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_eb2e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_eb2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_634b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_opc_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393
BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left,
BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right,
BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3
result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3
result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l113_c2_12c3
result_pc_MUX_uxn_opcodes_h_l113_c2_12c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond,
result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue,
result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse,
result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3
result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l113_c2_12c3
tmp16_MUX_uxn_opcodes_h_l113_c2_12c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond,
tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

-- printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e
printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e : entity work.printf_uxn_opcodes_h_l114_c3_fd4e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772
BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left,
BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right,
BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f
result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l118_c7_b80f
result_pc_MUX_uxn_opcodes_h_l118_c7_b80f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond,
result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue,
result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse,
result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l118_c7_b80f
tmp16_MUX_uxn_opcodes_h_l118_c7_b80f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond,
tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue,
tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse,
tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b
BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right,
BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4
result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l121_c7_70a4
result_pc_MUX_uxn_opcodes_h_l121_c7_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond,
result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue,
result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse,
result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l121_c7_70a4
tmp16_MUX_uxn_opcodes_h_l121_c7_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond,
tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l123_c3_fc21
CONST_SL_8_uxn_opcodes_h_l123_c3_fc21 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x,
CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043
BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf
BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l126_c7_d97a
result_pc_MUX_uxn_opcodes_h_l126_c7_d97a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond,
result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue,
result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse,
result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_d97a
tmp16_MUX_uxn_opcodes_h_l126_c7_d97a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb
BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left,
BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right,
BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25
BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left,
BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right,
BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output);

-- result_pc_MUX_uxn_opcodes_h_l129_c7_cb85
result_pc_MUX_uxn_opcodes_h_l129_c7_cb85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond,
result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue,
result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse,
result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output);

-- tmp16_MUX_uxn_opcodes_h_l129_c7_cb85
tmp16_MUX_uxn_opcodes_h_l129_c7_cb85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond,
tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue,
tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse,
tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a
BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left,
BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right,
BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left,
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right,
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left,
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right,
BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5
BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
 result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output,
 result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output,
 tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output,
 result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output,
 CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output,
 result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output,
 result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output,
 tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output,
 BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l124_c3_462b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l127_c3_7244 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l126_c7_d97a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l132_c3_738f : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l122_l130_DUPLICATE_c2d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_634b_uxn_opcodes_h_l139_l109_DUPLICATE_60b2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_e8cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l134_c11_a4d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c21_6043] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l118_c11_b772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_left;
     BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output := BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l121_c11_731b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_left;
     BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output := BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l122_l130_DUPLICATE_c2d5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l122_l130_DUPLICATE_c2d5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l127_c21_09fb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l129_c11_de25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_left;
     BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output := BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l113_c6_2393] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_left;
     BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output := BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l126_c7_d97a_return_output := result.ram_addr;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l113_c6_2393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l118_c11_b772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l121_c11_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_e8cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l129_c11_de25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_a4d5_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l124_c3_462b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c21_6043_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l127_c3_7244 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l127_c21_09fb_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l122_l130_DUPLICATE_c2d5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l122_l130_DUPLICATE_c2d5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l129_l126_l121_l113_l118_DUPLICATE_ef36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l129_l134_l126_l121_l118_DUPLICATE_2b10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l134_l126_l121_l113_l118_DUPLICATE_262c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l126_c7_d97a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l124_c3_462b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l127_c3_7244;
     -- CONST_SL_8[uxn_opcodes_h_l123_c3_fc21] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x <= VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output := CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_eb2e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l113_c1_1725] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l130_c3_f13a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_left;
     BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output := BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_eb2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right := VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l130_c3_f13a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l123_c3_fc21_return_output;
     VAR_printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l113_c1_1725_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_eb2e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l129_c7_cb85] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l132_c16_eddf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l121_c7_70a4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l129_c7_cb85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l129_c7_cb85] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_cond;
     tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue;
     tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output := tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;

     -- printf_uxn_opcodes_h_l114_c3_fd4e[uxn_opcodes_h_l114_c3_fd4e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l114_c3_fd4e_uxn_opcodes_h_l114_c3_fd4e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_eddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l132_c16_e6b1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l118_c7_b80f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l132_c3_738f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c16_e6b1_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue := VAR_result_pc_uxn_opcodes_h_l132_c3_738f;
     -- tmp16_MUX[uxn_opcodes_h_l121_c7_70a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_cond;
     tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output := tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l121_c7_70a4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l113_c2_12c3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l129_c7_cb85] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_cond;
     result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iftrue;
     result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output := result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l121_c7_70a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l129_c7_cb85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l118_c7_b80f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l118_c7_b80f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_cond;
     tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output := tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l118_c7_b80f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l126_c7_d97a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_cond;
     result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output := result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_d97a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l113_c2_12c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l121_c7_70a4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_cond;
     result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output := result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l113_c2_12c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l113_c2_12c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_cond;
     tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output := tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l121_c7_70a4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l118_c7_b80f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_cond;
     result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output := result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l118_c7_b80f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l113_c2_12c3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_cond;
     result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output := result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_634b_uxn_opcodes_h_l139_l109_DUPLICATE_60b2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_634b_uxn_opcodes_h_l139_l109_DUPLICATE_60b2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_634b(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l113_c2_12c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l113_c2_12c3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_634b_uxn_opcodes_h_l139_l109_DUPLICATE_60b2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_634b_uxn_opcodes_h_l139_l109_DUPLICATE_60b2_return_output;
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
