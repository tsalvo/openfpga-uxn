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
-- Submodules: 348
entity eval_opcode_0CLK_758df5c5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_758df5c5;
architecture arch of eval_opcode_0CLK_758df5c5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_d25b]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_20e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_204f]
signal result_MUX_uxn_opcodes_h_l1000_c2_204f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_740f]
signal opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_d598]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_fdcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_f1d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_20e0]
signal result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_15ae]
signal opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_bf9a]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_237f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_5c9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_f1d5]
signal result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_6350]
signal opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_7558]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_4220]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_c48b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_5c9a]
signal result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_ab4a]
signal opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_cd3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_bc8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_5e5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_c48b]
signal result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_7c14]
signal opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1c64]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_697b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_2fd3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_5e5f]
signal result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_5b9f]
signal opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_cc77]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_92a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_2bdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_2fd3]
signal result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_22e5]
signal opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_d269]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_22ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_77cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_2bdc]
signal result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_d7c6]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_7b93]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_6cee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_affc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_77cf]
signal result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_3c2a]
signal opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_0956]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_0c05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_0530]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_affc]
signal result_MUX_uxn_opcodes_h_l1009_c7_affc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_7aa9]
signal opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_6ad2]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_dba7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_5593]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_0530]
signal result_MUX_uxn_opcodes_h_l1010_c7_0530_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_4ad5]
signal opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_3a54]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_3cd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_bbe9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_5593]
signal result_MUX_uxn_opcodes_h_l1011_c7_5593_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_2cbb]
signal opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_e5d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_e149]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_ac50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_bbe9]
signal result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_7d9c]
signal opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_95b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_4b99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_0984]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_ac50]
signal result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_ed0a]
signal opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_cb34]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_dedb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_bf88]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_0984]
signal result_MUX_uxn_opcodes_h_l1014_c7_0984_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_6527]
signal opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6527_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6527_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_b7f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_43b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_7974]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_bf88]
signal result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_4416]
signal opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_4416_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_08d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_061d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_db1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_7974]
signal result_MUX_uxn_opcodes_h_l1016_c7_7974_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_b7d6]
signal opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_dcd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_b124]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_b680]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_db1a]
signal result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_a835]
signal opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a835_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_8fc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_bcd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_25f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_b680]
signal result_MUX_uxn_opcodes_h_l1018_c7_b680_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_1b45]
signal opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_1b45_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_425a]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_6013]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_e734]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_25f0]
signal result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_6531]
signal opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_6531_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_3f1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_e863]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_c192]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_e734]
signal result_MUX_uxn_opcodes_h_l1020_c7_e734_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_a71e]
signal opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_9f5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_5d75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_6483]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_c192]
signal result_MUX_uxn_opcodes_h_l1021_c7_c192_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_c8ba]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_85e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_05e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_4c33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_6483]
signal result_MUX_uxn_opcodes_h_l1022_c7_6483_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_4595]
signal opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_4595_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_4595_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_db22]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_319e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_86ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_4c33]
signal result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_c8ec]
signal opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_69e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_8535]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_d81d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_86ed]
signal result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_eafe]
signal opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_eafe_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_fefe]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_2489]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_df2b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_d81d]
signal result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_cf97]
signal opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_d108]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_6015]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9304]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_df2b]
signal result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_b410]
signal opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_b410_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_b410_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_160f]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_4f60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_ccaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_9304]
signal result_MUX_uxn_opcodes_h_l1027_c7_9304_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_95f7]
signal opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_26e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_6c97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_6e27]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_ccaf]
signal result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_9aee]
signal opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_9aee_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_d67f]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_3744]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_2ede]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_6e27]
signal result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_518f]
signal opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_518f_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_2c52]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_bf08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d393]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_2ede]
signal result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_bfff]
signal opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_73e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_bdf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_235f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_d393]
signal result_MUX_uxn_opcodes_h_l1031_c7_d393_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_00d8]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_02d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_e740]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_1e21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_235f]
signal result_MUX_uxn_opcodes_h_l1032_c7_235f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_61ef]
signal opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_157a]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_72e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_ccd1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_1e21]
signal result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_a0ea]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_5981]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_a6c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_9dcd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_ccd1]
signal result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_a38e]
signal opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_39f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_e090]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_9dd7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_9dcd]
signal result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_6c56]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_a4c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_e77f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_24e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_9dd7]
signal result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_561f]
signal opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_561f_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_561f_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_50ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_b166]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_643a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_24e1]
signal result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_155e]
signal opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_155e_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_d3ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_2259]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_5a8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_643a]
signal result_MUX_uxn_opcodes_h_l1038_c7_643a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_f027]
signal opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f027_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_c400]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_8953]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_dbc6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_5a8a]
signal result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_19a8]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_c242]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_4a90]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_19ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_dbc6]
signal result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_a365]
signal opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_a365_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_a365_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_875d]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_116a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_e85a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_19ca]
signal result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_a311]
signal opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_a311_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_98b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_3bac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_0ef5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_e85a]
signal result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_630b]
signal opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_630b_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6f02]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_539a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_16fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_0ef5]
signal result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_29f9]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_8911]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_e63a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_489e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_16fd]
signal result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_5c45]
signal opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_5c45_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_5c45_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_3b21]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_af2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_eafd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_489e]
signal result_MUX_uxn_opcodes_h_l1045_c7_489e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_05e3]
signal opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_05e3_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_b935]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_37e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_dc68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_eafd]
signal result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_0178]
signal opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_0178_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_0178_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_746f]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_2c21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_4657]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_dc68]
signal result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_27da]
signal opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_27da_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_7bac]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_995c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_5c29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_4657]
signal result_MUX_uxn_opcodes_h_l1048_c7_4657_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_c83c]
signal opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_c83c_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_b6d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_d0d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_4c32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_5c29]
signal result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_6d3f]
signal opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0b8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_bb60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_62b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_4c32]
signal result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_4928]
signal opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4928_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4928_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_102c]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_6208]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_ffa3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_62b8]
signal result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_4186]
signal opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_4186_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_8f66]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_d844]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_2379]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_ffa3]
signal result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_d401]
signal opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_d401_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_d401_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_8f3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_9be5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_5c22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_2379]
signal result_MUX_uxn_opcodes_h_l1053_c7_2379_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_2b2f]
signal opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_36ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_2321]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_b6b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_5c22]
signal result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_6072]
signal opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_6072_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_6072_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_6072_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_7ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_8bcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_9ed0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_b6b0]
signal result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_91b9]
signal opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_91b9_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_5f7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_10d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_0c7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_9ed0]
signal result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_0cd2]
signal opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_fb3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_70ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_6b16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_0c7f]
signal result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_0ff7]
signal opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_40f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_4475]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_f83b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_6b16]
signal result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_f5dc]
signal opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_6418]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_c856]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_4fb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_f83b]
signal result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_2a68]
signal opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_a353]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_c243]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_9b44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_4fb1]
signal result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_058e]
signal opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_058e_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_058e_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_058e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_8cff]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_acc8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_f167]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_9b44]
signal result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_d452]
signal opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d452_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d452_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_9b37]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_a35f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_8b61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_f167]
signal result_MUX_uxn_opcodes_h_l1062_c7_f167_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_4fa5]
signal opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_4fa5_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_e3cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_7bf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_60d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_8b61]
signal result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_ab09]
signal opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_ab09_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_5f9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_15dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_3a7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_60d5]
signal result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_965b]
signal opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_965b_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_965b_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_22fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_93aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_580e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_3a7e]
signal result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_f79e]
signal opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_8bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_2806]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_0a3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_580e]
signal result_MUX_uxn_opcodes_h_l1066_c7_580e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_1ddd]
signal opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_0a84]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_d11d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_e83f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_0a3d]
signal result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_32c9]
signal opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_8729]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_9a1e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_b2de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_e83f]
signal result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_c1da]
signal opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_c1da_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_6c95]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_ab89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_b2de]
signal result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_9573]
signal opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_9573_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_204f
result_MUX_uxn_opcodes_h_l1000_c2_204f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_204f_cond,
result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_740f
opc_brk_uxn_opcodes_h_l1000_c34_740f : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_20e0
result_MUX_uxn_opcodes_h_l1001_c7_20e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond,
result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_15ae
opc_jci_uxn_opcodes_h_l1001_c39_15ae : entity work.opc_jci_0CLK_1cb70a16 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_f1d5
result_MUX_uxn_opcodes_h_l1002_c7_f1d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond,
result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_6350
opc_jmi_uxn_opcodes_h_l1002_c39_6350 : entity work.opc_jmi_0CLK_8329ae76 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_5c9a
result_MUX_uxn_opcodes_h_l1003_c7_5c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond,
result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_ab4a
opc_jsi_uxn_opcodes_h_l1003_c39_ab4a : entity work.opc_jsi_0CLK_f07dff9f port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_c48b
result_MUX_uxn_opcodes_h_l1004_c7_c48b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond,
result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_7c14
opc_lit_uxn_opcodes_h_l1004_c39_7c14 : entity work.opc_lit_0CLK_39396305 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins,
opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_5e5f
result_MUX_uxn_opcodes_h_l1005_c7_5e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond,
result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_5b9f
opc_lit2_uxn_opcodes_h_l1005_c39_5b9f : entity work.opc_lit2_0CLK_b9a5c78c port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_2fd3
result_MUX_uxn_opcodes_h_l1006_c7_2fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond,
result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_22e5
opc_litr_uxn_opcodes_h_l1006_c39_22e5 : entity work.opc_litr_0CLK_39396305 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins,
opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_2bdc
result_MUX_uxn_opcodes_h_l1007_c7_2bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond,
result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6
opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6 : entity work.opc_lit2r_0CLK_b9a5c78c port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_77cf
result_MUX_uxn_opcodes_h_l1008_c7_77cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond,
result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_3c2a
opc_inc_uxn_opcodes_h_l1008_c39_3c2a : entity work.opc_inc_0CLK_d6df7042 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins,
opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k,
opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_affc
result_MUX_uxn_opcodes_h_l1009_c7_affc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_affc_cond,
result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_7aa9
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9 : entity work.opc_inc2_0CLK_ab649236 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k,
opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_0530
result_MUX_uxn_opcodes_h_l1010_c7_0530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_0530_cond,
result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_4ad5
opc_pop_uxn_opcodes_h_l1010_c39_4ad5 : entity work.opc_pop_0CLK_dffed988 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins,
opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k,
opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_5593
result_MUX_uxn_opcodes_h_l1011_c7_5593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_5593_cond,
result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_2cbb
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb : entity work.opc_pop2_0CLK_dffed988 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k,
opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_bbe9
result_MUX_uxn_opcodes_h_l1012_c7_bbe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond,
result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_7d9c
opc_nip_uxn_opcodes_h_l1012_c39_7d9c : entity work.opc_nip_0CLK_eee12f66 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins,
opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k,
opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_ac50
result_MUX_uxn_opcodes_h_l1013_c7_ac50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond,
result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_ed0a
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a : entity work.opc_nip2_0CLK_595bc5ba port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k,
opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_0984
result_MUX_uxn_opcodes_h_l1014_c7_0984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_0984_cond,
result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_6527
opc_swp_uxn_opcodes_h_l1014_c39_6527 : entity work.opc_swp_0CLK_8b182ca9 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_6527_ins,
opc_swp_uxn_opcodes_h_l1014_c39_6527_k,
opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_bf88
result_MUX_uxn_opcodes_h_l1015_c7_bf88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond,
result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_4416
opc_swp2_uxn_opcodes_h_l1015_c39_4416 : entity work.opc_swp2_0CLK_1cf85e9c port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_4416_k,
opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_7974
result_MUX_uxn_opcodes_h_l1016_c7_7974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_7974_cond,
result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_b7d6
opc_rot_uxn_opcodes_h_l1016_c39_b7d6 : entity work.opc_rot_0CLK_4850ef50 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins,
opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k,
opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_db1a
result_MUX_uxn_opcodes_h_l1017_c7_db1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond,
result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_a835
opc_rot2_uxn_opcodes_h_l1017_c39_a835 : entity work.opc_rot2_0CLK_49c1023c port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_a835_k,
opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_b680
result_MUX_uxn_opcodes_h_l1018_c7_b680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_b680_cond,
result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_1b45
opc_dup_uxn_opcodes_h_l1018_c39_1b45 : entity work.opc_dup_0CLK_dd62d56e port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins,
opc_dup_uxn_opcodes_h_l1018_c39_1b45_k,
opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_25f0
result_MUX_uxn_opcodes_h_l1019_c7_25f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond,
result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_6531
opc_dup2_uxn_opcodes_h_l1019_c39_6531 : entity work.opc_dup2_0CLK_c8878770 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_6531_k,
opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_e734
result_MUX_uxn_opcodes_h_l1020_c7_e734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_e734_cond,
result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_a71e
opc_ovr_uxn_opcodes_h_l1020_c39_a71e : entity work.opc_ovr_0CLK_09d9764c port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k,
opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_c192
result_MUX_uxn_opcodes_h_l1021_c7_c192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_c192_cond,
result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba : entity work.opc_ovr2_0CLK_3d799363 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_6483
result_MUX_uxn_opcodes_h_l1022_c7_6483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_6483_cond,
result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_4595
opc_equ_uxn_opcodes_h_l1022_c39_4595 : entity work.opc_equ_0CLK_4bcf4f80 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_4595_ins,
opc_equ_uxn_opcodes_h_l1022_c39_4595_k,
opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_4c33
result_MUX_uxn_opcodes_h_l1023_c7_4c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond,
result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_c8ec
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec : entity work.opc_equ2_0CLK_aa0f47c3 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k,
opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_86ed
result_MUX_uxn_opcodes_h_l1024_c7_86ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond,
result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_eafe
opc_neq_uxn_opcodes_h_l1024_c39_eafe : entity work.opc_neq_0CLK_4bcf4f80 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins,
opc_neq_uxn_opcodes_h_l1024_c39_eafe_k,
opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_d81d
result_MUX_uxn_opcodes_h_l1025_c7_d81d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond,
result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_cf97
opc_neq2_uxn_opcodes_h_l1025_c39_cf97 : entity work.opc_neq2_0CLK_aa0f47c3 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k,
opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_df2b
result_MUX_uxn_opcodes_h_l1026_c7_df2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond,
result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_b410
opc_gth_uxn_opcodes_h_l1026_c39_b410 : entity work.opc_gth_0CLK_4bcf4f80 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_b410_ins,
opc_gth_uxn_opcodes_h_l1026_c39_b410_k,
opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_9304
result_MUX_uxn_opcodes_h_l1027_c7_9304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_9304_cond,
result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_95f7
opc_gth2_uxn_opcodes_h_l1027_c39_95f7 : entity work.opc_gth2_0CLK_aa0f47c3 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k,
opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_ccaf
result_MUX_uxn_opcodes_h_l1028_c7_ccaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond,
result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_9aee
opc_lth_uxn_opcodes_h_l1028_c39_9aee : entity work.opc_lth_0CLK_4bcf4f80 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins,
opc_lth_uxn_opcodes_h_l1028_c39_9aee_k,
opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_6e27
result_MUX_uxn_opcodes_h_l1029_c7_6e27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond,
result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_518f
opc_lth2_uxn_opcodes_h_l1029_c39_518f : entity work.opc_lth2_0CLK_aa0f47c3 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_518f_k,
opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_2ede
result_MUX_uxn_opcodes_h_l1030_c7_2ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond,
result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_bfff
opc_jmp_uxn_opcodes_h_l1030_c39_bfff : entity work.opc_jmp_0CLK_ab8f8397 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k,
opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_d393
result_MUX_uxn_opcodes_h_l1031_c7_d393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_d393_cond,
result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_00d8
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8 : entity work.opc_jmp2_0CLK_cd0ff700 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_235f
result_MUX_uxn_opcodes_h_l1032_c7_235f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_235f_cond,
result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_61ef
opc_jcn_uxn_opcodes_h_l1032_c39_61ef : entity work.opc_jcn_0CLK_7f8adde9 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k,
opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_1e21
result_MUX_uxn_opcodes_h_l1033_c7_1e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond,
result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea : entity work.opc_jcn2_0CLK_fc8f03ff port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_ccd1
result_MUX_uxn_opcodes_h_l1034_c7_ccd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond,
result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_a38e
opc_jsr_uxn_opcodes_h_l1034_c39_a38e : entity work.opc_jsr_0CLK_1d648d8a port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k,
opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_9dcd
result_MUX_uxn_opcodes_h_l1035_c7_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond,
result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_6c56
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56 : entity work.opc_jsr2_0CLK_421159e4 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_9dd7
result_MUX_uxn_opcodes_h_l1036_c7_9dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond,
result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_561f
opc_sth_uxn_opcodes_h_l1036_c39_561f : entity work.opc_sth_0CLK_3ec49a15 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_561f_ins,
opc_sth_uxn_opcodes_h_l1036_c39_561f_k,
opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_24e1
result_MUX_uxn_opcodes_h_l1037_c7_24e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond,
result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_155e
opc_sth2_uxn_opcodes_h_l1037_c39_155e : entity work.opc_sth2_0CLK_186906f2 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_155e_k,
opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_643a
result_MUX_uxn_opcodes_h_l1038_c7_643a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_643a_cond,
result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_f027
opc_ldz_uxn_opcodes_h_l1038_c39_f027 : entity work.opc_ldz_0CLK_186a1060 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_f027_k,
opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_5a8a
result_MUX_uxn_opcodes_h_l1039_c7_5a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond,
result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_19a8
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8 : entity work.opc_ldz2_0CLK_715b39af port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_dbc6
result_MUX_uxn_opcodes_h_l1040_c7_dbc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond,
result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_a365
opc_stz_uxn_opcodes_h_l1040_c39_a365 : entity work.opc_stz_0CLK_09628701 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_a365_ins,
opc_stz_uxn_opcodes_h_l1040_c39_a365_k,
opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_19ca
result_MUX_uxn_opcodes_h_l1041_c7_19ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond,
result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_a311
opc_stz2_uxn_opcodes_h_l1041_c39_a311 : entity work.opc_stz2_0CLK_fcea82bd port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_a311_k,
opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_e85a
result_MUX_uxn_opcodes_h_l1042_c7_e85a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond,
result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_630b
opc_ldr_uxn_opcodes_h_l1042_c39_630b : entity work.opc_ldr_0CLK_8fa637fc port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_630b_k,
opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_0ef5
result_MUX_uxn_opcodes_h_l1043_c7_0ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond,
result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_29f9
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9 : entity work.opc_ldr2_0CLK_342b1f85 port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_16fd
result_MUX_uxn_opcodes_h_l1044_c7_16fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond,
result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_5c45
opc_str_uxn_opcodes_h_l1044_c39_5c45 : entity work.opc_str_0CLK_6907c6c7 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_5c45_ins,
opc_str_uxn_opcodes_h_l1044_c39_5c45_k,
opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_489e
result_MUX_uxn_opcodes_h_l1045_c7_489e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_489e_cond,
result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_05e3
opc_str2_uxn_opcodes_h_l1045_c39_05e3 : entity work.opc_str2_0CLK_832140c2 port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins,
opc_str2_uxn_opcodes_h_l1045_c39_05e3_k,
opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_eafd
result_MUX_uxn_opcodes_h_l1046_c7_eafd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond,
result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_0178
opc_lda_uxn_opcodes_h_l1046_c39_0178 : entity work.opc_lda_0CLK_fa52deeb port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_0178_ins,
opc_lda_uxn_opcodes_h_l1046_c39_0178_k,
opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_dc68
result_MUX_uxn_opcodes_h_l1047_c7_dc68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond,
result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_27da
opc_lda2_uxn_opcodes_h_l1047_c39_27da : entity work.opc_lda2_0CLK_fa52deeb port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_27da_k,
opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_4657
result_MUX_uxn_opcodes_h_l1048_c7_4657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_4657_cond,
result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_c83c
opc_sta_uxn_opcodes_h_l1048_c39_c83c : entity work.opc_sta_0CLK_0d25632a port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins,
opc_sta_uxn_opcodes_h_l1048_c39_c83c_k,
opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_5c29
result_MUX_uxn_opcodes_h_l1049_c7_5c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond,
result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_6d3f
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f : entity work.opc_sta2_0CLK_b9e30a7a port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k,
opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_4c32
result_MUX_uxn_opcodes_h_l1050_c7_4c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond,
result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_4928
opc_dei_uxn_opcodes_h_l1050_c39_4928 : entity work.opc_dei_0CLK_4cadf5f3 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_4928_ins,
opc_dei_uxn_opcodes_h_l1050_c39_4928_k,
opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_62b8
result_MUX_uxn_opcodes_h_l1051_c7_62b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond,
result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_4186
opc_dei2_uxn_opcodes_h_l1051_c39_4186 : entity work.opc_dei2_0CLK_1a8244c2 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_4186_k,
opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_ffa3
result_MUX_uxn_opcodes_h_l1052_c7_ffa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond,
result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_d401
opc_deo_uxn_opcodes_h_l1052_c39_d401 : entity work.opc_deo_0CLK_434848af port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_d401_ins,
opc_deo_uxn_opcodes_h_l1052_c39_d401_k,
opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_2379
result_MUX_uxn_opcodes_h_l1053_c7_2379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_2379_cond,
result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_2b2f
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f : entity work.opc_deo2_0CLK_d7508b32 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k,
opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_5c22
result_MUX_uxn_opcodes_h_l1054_c7_5c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond,
result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_6072
opc_add_uxn_opcodes_h_l1054_c39_6072 : entity work.opc_add_0CLK_fec2727b port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_6072_ins,
opc_add_uxn_opcodes_h_l1054_c39_6072_k,
opc_add_uxn_opcodes_h_l1054_c39_6072_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_b6b0
result_MUX_uxn_opcodes_h_l1055_c7_b6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond,
result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_91b9
opc_add2_uxn_opcodes_h_l1055_c39_91b9 : entity work.opc_add2_0CLK_3ec85585 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins,
opc_add2_uxn_opcodes_h_l1055_c39_91b9_k,
opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_9ed0
result_MUX_uxn_opcodes_h_l1056_c7_9ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond,
result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_0cd2
opc_sub_uxn_opcodes_h_l1056_c39_0cd2 : entity work.opc_sub_0CLK_fec2727b port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins,
opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k,
opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_0c7f
result_MUX_uxn_opcodes_h_l1057_c7_0c7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond,
result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_0ff7
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7 : entity work.opc_sub2_0CLK_3ec85585 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k,
opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_6b16
result_MUX_uxn_opcodes_h_l1058_c7_6b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond,
result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_f5dc
opc_mul_uxn_opcodes_h_l1058_c39_f5dc : entity work.opc_mul_0CLK_fec2727b port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins,
opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k,
opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_f83b
result_MUX_uxn_opcodes_h_l1059_c7_f83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond,
result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_2a68
opc_mul2_uxn_opcodes_h_l1059_c39_2a68 : entity work.opc_mul2_0CLK_3ec85585 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k,
opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_4fb1
result_MUX_uxn_opcodes_h_l1060_c7_4fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond,
result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_058e
opc_div_uxn_opcodes_h_l1060_c39_058e : entity work.opc_div_0CLK_eff7b951 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_058e_ins,
opc_div_uxn_opcodes_h_l1060_c39_058e_k,
opc_div_uxn_opcodes_h_l1060_c39_058e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_9b44
result_MUX_uxn_opcodes_h_l1061_c7_9b44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond,
result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_d452
opc_div2_uxn_opcodes_h_l1061_c39_d452 : entity work.opc_div2_0CLK_e1a1d759 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_d452_ins,
opc_div2_uxn_opcodes_h_l1061_c39_d452_k,
opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_f167
result_MUX_uxn_opcodes_h_l1062_c7_f167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_f167_cond,
result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_4fa5
opc_and_uxn_opcodes_h_l1062_c39_4fa5 : entity work.opc_and_0CLK_fec2727b port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins,
opc_and_uxn_opcodes_h_l1062_c39_4fa5_k,
opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_8b61
result_MUX_uxn_opcodes_h_l1063_c7_8b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond,
result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_ab09
opc_and2_uxn_opcodes_h_l1063_c39_ab09 : entity work.opc_and2_0CLK_3ec85585 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins,
opc_and2_uxn_opcodes_h_l1063_c39_ab09_k,
opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_60d5
result_MUX_uxn_opcodes_h_l1064_c7_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond,
result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_965b
opc_ora_uxn_opcodes_h_l1064_c39_965b : entity work.opc_ora_0CLK_fec2727b port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_965b_ins,
opc_ora_uxn_opcodes_h_l1064_c39_965b_k,
opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_3a7e
result_MUX_uxn_opcodes_h_l1065_c7_3a7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond,
result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_f79e
opc_ora2_uxn_opcodes_h_l1065_c39_f79e : entity work.opc_ora2_0CLK_3ec85585 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k,
opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_580e
result_MUX_uxn_opcodes_h_l1066_c7_580e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_580e_cond,
result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_1ddd
opc_eor_uxn_opcodes_h_l1066_c39_1ddd : entity work.opc_eor_0CLK_fec2727b port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins,
opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k,
opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_0a3d
result_MUX_uxn_opcodes_h_l1067_c7_0a3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond,
result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_32c9
opc_eor2_uxn_opcodes_h_l1067_c39_32c9 : entity work.opc_eor2_0CLK_3ec85585 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k,
opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_e83f
result_MUX_uxn_opcodes_h_l1068_c7_e83f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond,
result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_c1da
opc_sft_uxn_opcodes_h_l1068_c39_c1da : entity work.opc_sft_0CLK_db76791a port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins,
opc_sft_uxn_opcodes_h_l1068_c39_c1da_k,
opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_b2de
result_MUX_uxn_opcodes_h_l1069_c7_b2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond,
result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_9573
opc_sft2_uxn_opcodes_h_l1069_c39_9573 : entity work.opc_sft2_0CLK_effe98ec port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_9573_k,
opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 opcode,
 ins,
 k,
 -- Registers
 t8,
 n8,
 l8,
 tmp8,
 t16,
 n16,
 l16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_6072_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_058e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right := to_unsigned(252, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right := to_unsigned(251, 8);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right := to_unsigned(255, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right := to_unsigned(34, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right := to_unsigned(23, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right := to_unsigned(249, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right := to_unsigned(250, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_opcode := opcode;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_b935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_40f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_36ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_7b93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_db22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_9b37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_5f9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_a353] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_740f] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output := opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_8729] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_fefe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_b7f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1c64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_c242] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_22fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_d25b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_8fc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_425a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_d67f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_b6d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_d108] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_cb34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_0a84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6f02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_a4c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_73e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_7558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_6c95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_8cff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_50ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_2c52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_95b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_746f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_157a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_3f1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_7bac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_8bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_85e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_5f7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_d269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_fb3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_26e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_5981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_cc77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_102c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_e5d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_98b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_02d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_3b21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_8f66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_6418] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_9f5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_39f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_0956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_cd3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_e3cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0b8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_d3ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_d598] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_c400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_875d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_160f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_3a54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_6ad2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_bf9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_8911] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_dcd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_8f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_08d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_69e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_7ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d25b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_d598_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bf9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_7558_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_cd3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1c64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_cc77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_d269_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_7b93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_0956_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6ad2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_3a54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_e5d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_95b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_b7f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_08d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_dcd8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8fc8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_425a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3f1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_9f5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_85e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_db22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_69e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_fefe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d108_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_160f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_26e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_d67f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_2c52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_73e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_02d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_157a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_5981_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_39f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_a4c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_50ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_d3ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_c400_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c242_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_875d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_98b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6f02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_8911_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_3b21_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b935_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_746f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7bac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_b6d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0b8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_102c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_8f66_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_8f3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_36ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_7ca3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_5f7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_fb3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_40f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6418_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_a353_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8cff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_9b37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e3cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5f9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_22fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_8bf7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0a84_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_8729_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_6c95_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_740f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_20e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_f1d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_fdcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_fdcd_return_output;
     -- opc_jci[uxn_opcodes_h_l1001_c39_15ae] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output := opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_237f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_5c9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_237f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_15ae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_4220] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_c48b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_6350] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4220_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_6350_return_output;
     -- opc_jsi[uxn_opcodes_h_l1003_c39_ab4a] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_5e5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_bc8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_bc8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ab4a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_2fd3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_697b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_7c14] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output := opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_697b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_7c14_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_2bdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_5b9f] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_92a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_92a7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_5b9f_return_output;
     -- opc_litr[uxn_opcodes_h_l1006_c39_22e5] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output := opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_22ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_77cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_22ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_22e5_return_output;
     -- opc_lit2r[uxn_opcodes_h_l1007_c39_d7c6] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_affc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_6cee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_affc_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_6cee_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d7c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_0c05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_3c2a] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output := opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_0530] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_0530_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_0c05_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_3c2a_return_output;
     -- opc_inc2[uxn_opcodes_h_l1009_c39_7aa9] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_dba7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_5593] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_5593_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dba7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7aa9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_3cd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_4ad5] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output := opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_bbe9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_3cd7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_4ad5_return_output;
     -- opc_pop2[uxn_opcodes_h_l1011_c39_2cbb] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_ac50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_e149] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_e149_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2cbb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_4b99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_0984] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_7d9c] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output := opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0984_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_4b99_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d9c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_bf88] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output;

     -- opc_nip2[uxn_opcodes_h_l1013_c39_ed0a] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_dedb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_dedb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_ed0a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_7974] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_43b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_6527] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_6527_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_6527_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output := opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7974_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_43b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_6527_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_061d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_db1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_4416] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_4416_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_061d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_4416_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_b680] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_b7d6] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output := opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_b124] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_b680_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_b124_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_b7d6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_bcd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_a835] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_a835_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_25f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_bcd4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a835_return_output;
     -- opc_dup[uxn_opcodes_h_l1018_c39_1b45] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_1b45_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output := opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_6013] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_e734] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_e734_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_6013_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_1b45_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_e863] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_c192] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_6531] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_6531_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_c192_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_e863_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_6531_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_5d75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_a71e] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_6483] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_6483_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_5d75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_a71e_return_output;
     -- opc_ovr2[uxn_opcodes_h_l1021_c39_c8ba] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_4c33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_05e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_05e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_c8ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_86ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_4595] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_4595_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_4595_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output := opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_319e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_319e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_4595_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_8535] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_d81d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output;

     -- opc_equ2[uxn_opcodes_h_l1023_c39_c8ec] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8535_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_c8ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_df2b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_2489] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_eafe] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_eafe_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output := opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2489_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_eafe_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9304] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_6015] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_cf97] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9304_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_6015_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_cf97_return_output;
     -- opc_gth[uxn_opcodes_h_l1026_c39_b410] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_b410_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_b410_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output := opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_ccaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_4f60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_4f60_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_b410_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_6e27] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output;

     -- opc_gth2[uxn_opcodes_h_l1027_c39_95f7] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_6c97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_6c97_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_95f7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_2ede] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_9aee] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_9aee_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output := opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_3744] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_3744_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_9aee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d393] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_bf08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_518f] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_518f_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d393_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_bf08_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_518f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_235f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_bdf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_bfff] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_235f_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_bdf1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_bfff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_e740] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_1e21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_00d8] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_e740_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_00d8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_72e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_61ef] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_ccd1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_72e0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_61ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_a6c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_a0ea] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_9dcd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_a6c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_e090] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_9dd7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_a38e] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_e090_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_a38e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_24e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_6c56] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_e77f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_e77f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_6c56_return_output;
     -- opc_sth[uxn_opcodes_h_l1036_c39_561f] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_561f_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_561f_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output := opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_643a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_b166] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_643a_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_b166_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_561f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_2259] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_5a8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output;

     -- opc_sth2[uxn_opcodes_h_l1037_c39_155e] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_155e_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_2259_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_155e_return_output;
     -- opc_ldz[uxn_opcodes_h_l1038_c39_f027] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_f027_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_dbc6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_8953] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_8953_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f027_return_output;
     -- opc_ldz2[uxn_opcodes_h_l1039_c39_19a8] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_19ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_4a90] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_4a90_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_19a8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_116a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_e85a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_a365] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_a365_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_a365_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output := opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_116a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_a365_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_3bac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_a311] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_a311_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_0ef5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3bac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_a311_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_539a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_16fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_630b] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_630b_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_539a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_630b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_489e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_e63a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_29f9] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_489e_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_e63a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_29f9_return_output;
     -- opc_str[uxn_opcodes_h_l1044_c39_5c45] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_5c45_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_ins;
     opc_str_uxn_opcodes_h_l1044_c39_5c45_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output := opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_af2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_eafd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_af2c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_5c45_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_37e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_dc68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_05e3] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_05e3_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output := opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_37e6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_05e3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_2c21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_0178] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_0178_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_0178_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output := opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_4657] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4657_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_2c21_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_0178_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_5c29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output;

     -- opc_lda2[uxn_opcodes_h_l1047_c39_27da] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_27da_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_995c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_995c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_27da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_4c32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_d0d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_c83c] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_c83c_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output := opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_d0d4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_c83c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_62b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_6d3f] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_bb60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_bb60_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_6d3f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_ffa3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output;

     -- opc_dei[uxn_opcodes_h_l1050_c39_4928] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_4928_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_4928_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output := opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_6208] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_6208_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_4928_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_d844] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_4186] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_4186_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_2379] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2379_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_d844_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_4186_return_output;
     -- opc_deo[uxn_opcodes_h_l1052_c39_d401] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_d401_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_d401_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output := opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_5c22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_9be5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9be5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_d401_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_2321] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_b6b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_2b2f] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2321_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_2b2f_return_output;
     -- opc_add[uxn_opcodes_h_l1054_c39_6072] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_6072_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_ins;
     opc_add_uxn_opcodes_h_l1054_c39_6072_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_return_output := opc_add_uxn_opcodes_h_l1054_c39_6072_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_9ed0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_8bcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8bcf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_6072_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_0c7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_10d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_91b9] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_91b9_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output := opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_10d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_91b9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_70ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_6b16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_0cd2] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output := opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_70ea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_0cd2_return_output;
     -- opc_sub2[uxn_opcodes_h_l1057_c39_0ff7] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_f83b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_4475] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4475_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0ff7_return_output;
     -- opc_mul[uxn_opcodes_h_l1058_c39_f5dc] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output := opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_4fb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_c856] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c856_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_f5dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_c243] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_2a68] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_9b44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_c243_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2a68_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_f167] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_058e] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_058e_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_ins;
     opc_div_uxn_opcodes_h_l1060_c39_058e_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_return_output := opc_div_uxn_opcodes_h_l1060_c39_058e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_acc8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_f167_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_acc8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_058e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_a35f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_d452] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_d452_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_d452_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output := opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_8b61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_a35f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_d452_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_60d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_7bf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_4fa5] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_ins;
     opc_and_uxn_opcodes_h_l1062_c39_4fa5_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output := opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_7bf1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_4fa5_return_output;
     -- opc_and2[uxn_opcodes_h_l1063_c39_ab09] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_ab09_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output := opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_3a7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_15dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_15dc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_ab09_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_580e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_965b] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_965b_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_965b_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output := opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_93aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_580e_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_93aa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_965b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_2806] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output;

     -- opc_ora2[uxn_opcodes_h_l1065_c39_f79e] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_0a3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_2806_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_f79e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_e83f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output;

     -- opc_eor[uxn_opcodes_h_l1066_c39_1ddd] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output := opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_d11d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d11d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_1ddd_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_32c9] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_b2de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_9a1e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_9a1e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_32c9_return_output;
     -- opc_sft[uxn_opcodes_h_l1068_c39_c1da] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_c1da_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output := opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_ab89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_ab89_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_c1da_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_9573] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_9573_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_9573_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_b2de] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output := result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_b2de_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_e83f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output := result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_e83f_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_0a3d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output := result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a3d_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_580e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_580e_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output := result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_580e_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_3a7e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output := result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_3a7e_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_60d5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output := result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_60d5_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_8b61] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output := result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_8b61_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_f167] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_f167_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output := result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_f167_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_9b44] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output := result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_9b44_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_4fb1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output := result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_4fb1_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_f83b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output := result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_f83b_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_6b16] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output := result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_6b16_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_0c7f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output := result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_0c7f_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_9ed0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output := result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_9ed0_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_b6b0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output := result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_b6b0_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_5c22] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output := result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_5c22_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_2379] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_2379_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output := result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_2379_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_ffa3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output := result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_ffa3_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_62b8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output := result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_62b8_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_4c32] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output := result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_4c32_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_5c29] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output := result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_5c29_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_4657] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_4657_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output := result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_4657_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_dc68] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output := result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_dc68_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_eafd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output := result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_eafd_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_489e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_489e_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output := result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_489e_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_16fd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output := result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_16fd_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_0ef5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output := result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_0ef5_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_e85a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output := result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_e85a_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_19ca] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output := result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_19ca_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_dbc6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output := result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_dbc6_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_5a8a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output := result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_5a8a_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_643a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_643a_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output := result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_643a_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_24e1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output := result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_24e1_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_9dd7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output := result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_9dd7_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_9dcd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output := result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_9dcd_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_ccd1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output := result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_ccd1_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_1e21] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output := result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_1e21_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_235f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_235f_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output := result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_235f_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_d393] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_d393_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output := result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_d393_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_2ede] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output := result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_2ede_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_6e27] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output := result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_6e27_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_ccaf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output := result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_ccaf_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_9304] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_9304_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output := result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_9304_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_df2b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output := result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_df2b_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_d81d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output := result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_d81d_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_86ed] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output := result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_86ed_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_4c33] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output := result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_4c33_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_6483] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_6483_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output := result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_6483_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_c192] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_c192_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output := result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_c192_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_e734] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_e734_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output := result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_e734_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_25f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output := result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_25f0_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_b680] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_b680_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output := result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_b680_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_db1a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output := result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_db1a_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_7974] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_7974_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output := result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_7974_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_bf88] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output := result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_bf88_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_0984] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_0984_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output := result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_0984_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_ac50] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output := result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_ac50_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_bbe9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output := result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_bbe9_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_5593] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_5593_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output := result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_5593_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_0530] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_0530_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output := result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_0530_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_affc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_affc_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output := result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_affc_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_77cf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output := result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_77cf_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_2bdc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output := result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_2bdc_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_2fd3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output := result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_2fd3_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_5e5f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output := result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_5e5f_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_c48b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output := result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_c48b_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_5c9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output := result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_5c9a_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_f1d5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output := result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_f1d5_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_20e0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output := result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_20e0_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_204f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_204f_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output := result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_204f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     tmp8 <= REG_COMB_tmp8;
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
