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
entity eval_opcode_0CLK_44dad49a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_44dad49a;
architecture arch of eval_opcode_0CLK_44dad49a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_8e68]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_d85f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_b9a4]
signal result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_6010]
signal opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_81c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_9030]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_58ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_d85f]
signal result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_494f]
signal opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_29eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_0682]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_806b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_58ee]
signal result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_48cc]
signal opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9b10]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_628c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_3c22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_806b]
signal result_MUX_uxn_opcodes_h_l1003_c7_806b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_3022]
signal opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_065e]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_5765]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_165b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_3c22]
signal result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_aad8]
signal opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1cb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_7775]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_e6e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_165b]
signal result_MUX_uxn_opcodes_h_l1005_c7_165b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_6eea]
signal opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_47f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_b2f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_2fde]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_e6e5]
signal result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_1364]
signal opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_1364_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_a192]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_bb12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_309d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_2fde]
signal result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_d429]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_e4b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_14c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_1115]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_309d]
signal result_MUX_uxn_opcodes_h_l1008_c7_309d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_fdb5]
signal opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_ce10]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_bd08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_2c4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_1115]
signal result_MUX_uxn_opcodes_h_l1009_c7_1115_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_7fb6]
signal opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_2be8]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_5187]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_2d27]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_2c4d]
signal result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_0b24]
signal opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_0b24_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_2ccd]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_6a09]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_5ce9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_2d27]
signal result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_a00c]
signal opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_1baa]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_2047]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_4b35]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_5ce9]
signal result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_00a1]
signal opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_00a1_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_34f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_6cd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_23b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_4b35]
signal result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_a912]
signal opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a912_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_7598]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_2f2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_827f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_23b6]
signal result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_dbad]
signal opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_dbad_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_6723]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_ccbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_7407]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_827f]
signal result_MUX_uxn_opcodes_h_l1015_c7_827f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_2354]
signal opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_2354_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_db49]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_ccbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_e370]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_7407]
signal result_MUX_uxn_opcodes_h_l1016_c7_7407_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_c351]
signal opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_c351_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_c351_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_793f]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_3693]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_432b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_e370]
signal result_MUX_uxn_opcodes_h_l1017_c7_e370_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_2567]
signal opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_2567_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_bd0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_eac0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_4478]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_432b]
signal result_MUX_uxn_opcodes_h_l1018_c7_432b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_de19]
signal opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_de19_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_de19_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_326d]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_98aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_07a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_4478]
signal result_MUX_uxn_opcodes_h_l1019_c7_4478_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_abe6]
signal opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9f3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_f843]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_f251]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_07a2]
signal result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_477a]
signal opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_477a_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_7471]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_a70d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_eccc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_f251]
signal result_MUX_uxn_opcodes_h_l1021_c7_f251_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_36df]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_6dcb]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_b73a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_a62a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_eccc]
signal result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_393b]
signal opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_393b_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_393b_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_82c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_746f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_ef40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_a62a]
signal result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_6cd8]
signal opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_cdf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_a4ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_cc58]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_ef40]
signal result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_3d99]
signal opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_3d99_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_6482]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_f19e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_a337]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_cc58]
signal result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_39c7]
signal opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_5e5f]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_fdd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_494c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_a337]
signal result_MUX_uxn_opcodes_h_l1026_c7_a337_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_433e]
signal opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_433e_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_433e_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_9a18]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_7af1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_b77d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_494c]
signal result_MUX_uxn_opcodes_h_l1027_c7_494c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_0f20]
signal opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_121a]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_e634]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9880]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_b77d]
signal result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_e5d6]
signal opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_5a05]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_2e9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_b7dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_9880]
signal result_MUX_uxn_opcodes_h_l1029_c7_9880_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_b227]
signal opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b227_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_c080]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_d82a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_df51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_b7dc]
signal result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_80bf]
signal opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_8cce]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_5714]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_415a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_df51]
signal result_MUX_uxn_opcodes_h_l1031_c7_df51_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_84b5]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_7dce]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_18af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_d371]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_415a]
signal result_MUX_uxn_opcodes_h_l1032_c7_415a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_a428]
signal opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_a428_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_d396]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_b1d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_2364]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_d371]
signal result_MUX_uxn_opcodes_h_l1033_c7_d371_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_589d]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_e57c]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_501d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_1d98]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_2364]
signal result_MUX_uxn_opcodes_h_l1034_c7_2364_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_c4df]
signal opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_aa2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_b2ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d38b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_1d98]
signal result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_ca25]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_5f98]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_f1a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_6f42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_d38b]
signal result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_5fb7]
signal opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_6c01]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_f78b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_af4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_6f42]
signal result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_4e09]
signal opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_f952]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_8971]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_0c06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_af4b]
signal result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_c967]
signal opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_c967_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_a1fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_b6d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_1941]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_0c06]
signal result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_9932]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_c389]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_34d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_d9b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_1941]
signal result_MUX_uxn_opcodes_h_l1040_c7_1941_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_e0d8]
signal opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ba89]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_a1ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_8398]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_d9b5]
signal result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_9dfd]
signal opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_88cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_ffb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_2e99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_8398]
signal result_MUX_uxn_opcodes_h_l1042_c7_8398_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_90b2]
signal opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6313]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_2bdf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_272c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_2e99]
signal result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_ca53]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_3980]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_c564]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_1ce1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_272c]
signal result_MUX_uxn_opcodes_h_l1044_c7_272c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_2858]
signal opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_2858_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_2858_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_2858_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_53c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_858d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_13a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_1ce1]
signal result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_ffde]
signal opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ffde_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_aec8]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_a363]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_5251]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_13a7]
signal result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_5c99]
signal opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_5c99_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_dbb1]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_830c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_0365]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_5251]
signal result_MUX_uxn_opcodes_h_l1047_c7_5251_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_1968]
signal opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_1968_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_4ded]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_01cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_1b9f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_0365]
signal result_MUX_uxn_opcodes_h_l1048_c7_0365_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_71d7]
signal opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_71d7_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_890b]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_749e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_7675]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_1b9f]
signal result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_a58c]
signal opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_6fd4]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_da6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_87d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_7675]
signal result_MUX_uxn_opcodes_h_l1050_c7_7675_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_472f]
signal opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_472f_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_472f_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_2c09]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_7f57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_50cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_87d4]
signal result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_48a0]
signal opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_87cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_9fa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_ce28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_50cb]
signal result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_083e]
signal opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_083e_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_083e_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_87a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_9eaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_50e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_ce28]
signal result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_dfac]
signal opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_1586]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_73b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_5baa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_50e9]
signal result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_57ed]
signal opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_57ed_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_57ed_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_acfd]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_122d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_0ece]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_5baa]
signal result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_2374]
signal opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_2374_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_2374_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_46cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_4c5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_cf36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_0ece]
signal result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_0095]
signal opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0095_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0095_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_e7ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_d0dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_3a3f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_cf36]
signal result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_c7fb]
signal opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_456f]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_5310]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_6f36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_3a3f]
signal result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_041a]
signal opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_041a_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_041a_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_8768]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_bf39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_fb24]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_6f36]
signal result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_d24b]
signal opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_3ba6]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_a62a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_ef7c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_fb24]
signal result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_0e05]
signal opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0e05_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0e05_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_66e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_7c58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_ca92]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_ef7c]
signal result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_5b3e]
signal opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_add0]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_aecd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_a4eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_ca92]
signal result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_6954]
signal opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_6954_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_6954_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_6954_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_1aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_9218]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_1d26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_a4eb]
signal result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_c342]
signal opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_c342_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_c342_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_5feb]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_b80c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_4a1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_1d26]
signal result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_3b83]
signal opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3b83_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_4502]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_e322]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_717b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_4a1f]
signal result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_b842]
signal opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_b842_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_671b]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_02f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_ad5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_717b]
signal result_MUX_uxn_opcodes_h_l1066_c7_717b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_6e2c]
signal opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e90f]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_fb9f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_d8a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_ad5e]
signal result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_620a]
signal opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_620a_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_d3a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_39b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_565b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_d8a2]
signal result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_ef33]
signal opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ef33_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_861f]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_a3ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_565b]
signal result_MUX_uxn_opcodes_h_l1069_c7_565b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_26be]
signal opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_26be_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_b9a4
result_MUX_uxn_opcodes_h_l1000_c2_b9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond,
result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_6010
opc_brk_uxn_opcodes_h_l1000_c34_6010 : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_d85f
result_MUX_uxn_opcodes_h_l1001_c7_d85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond,
result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_494f
opc_jci_uxn_opcodes_h_l1001_c39_494f : entity work.opc_jci_0CLK_4c4669f6 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_58ee
result_MUX_uxn_opcodes_h_l1002_c7_58ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond,
result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_48cc
opc_jmi_uxn_opcodes_h_l1002_c39_48cc : entity work.opc_jmi_0CLK_dd82b7a2 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_806b
result_MUX_uxn_opcodes_h_l1003_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_806b_cond,
result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_3022
opc_jsi_uxn_opcodes_h_l1003_c39_3022 : entity work.opc_jsi_0CLK_0a77da6f port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_3c22
result_MUX_uxn_opcodes_h_l1004_c7_3c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond,
result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_aad8
opc_lit_uxn_opcodes_h_l1004_c39_aad8 : entity work.opc_lit_0CLK_fb192e55 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins,
opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_165b
result_MUX_uxn_opcodes_h_l1005_c7_165b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_165b_cond,
result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_6eea
opc_lit2_uxn_opcodes_h_l1005_c39_6eea : entity work.opc_lit2_0CLK_3aa2ab20 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_e6e5
result_MUX_uxn_opcodes_h_l1006_c7_e6e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond,
result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_1364
opc_litr_uxn_opcodes_h_l1006_c39_1364 : entity work.opc_litr_0CLK_fb192e55 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_1364_ins,
opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_2fde
result_MUX_uxn_opcodes_h_l1007_c7_2fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond,
result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_d429
opc_lit2r_uxn_opcodes_h_l1007_c39_d429 : entity work.opc_lit2r_0CLK_3aa2ab20 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_309d
result_MUX_uxn_opcodes_h_l1008_c7_309d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_309d_cond,
result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_fdb5
opc_inc_uxn_opcodes_h_l1008_c39_fdb5 : entity work.opc_inc_0CLK_d6df7042 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins,
opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k,
opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_1115
result_MUX_uxn_opcodes_h_l1009_c7_1115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_1115_cond,
result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_7fb6
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6 : entity work.opc_inc2_0CLK_ab649236 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k,
opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_2c4d
result_MUX_uxn_opcodes_h_l1010_c7_2c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond,
result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_0b24
opc_pop_uxn_opcodes_h_l1010_c39_0b24 : entity work.opc_pop_0CLK_dffed988 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins,
opc_pop_uxn_opcodes_h_l1010_c39_0b24_k,
opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_2d27
result_MUX_uxn_opcodes_h_l1011_c7_2d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond,
result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_a00c
opc_pop2_uxn_opcodes_h_l1011_c39_a00c : entity work.opc_pop2_0CLK_dffed988 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k,
opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_5ce9
result_MUX_uxn_opcodes_h_l1012_c7_5ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond,
result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_00a1
opc_nip_uxn_opcodes_h_l1012_c39_00a1 : entity work.opc_nip_0CLK_eee12f66 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins,
opc_nip_uxn_opcodes_h_l1012_c39_00a1_k,
opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_4b35
result_MUX_uxn_opcodes_h_l1013_c7_4b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond,
result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_a912
opc_nip2_uxn_opcodes_h_l1013_c39_a912 : entity work.opc_nip2_0CLK_595bc5ba port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_a912_k,
opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_23b6
result_MUX_uxn_opcodes_h_l1014_c7_23b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond,
result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_dbad
opc_swp_uxn_opcodes_h_l1014_c39_dbad : entity work.opc_swp_0CLK_8b182ca9 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins,
opc_swp_uxn_opcodes_h_l1014_c39_dbad_k,
opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_827f
result_MUX_uxn_opcodes_h_l1015_c7_827f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_827f_cond,
result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_2354
opc_swp2_uxn_opcodes_h_l1015_c39_2354 : entity work.opc_swp2_0CLK_1cf85e9c port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_2354_k,
opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_7407
result_MUX_uxn_opcodes_h_l1016_c7_7407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_7407_cond,
result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_c351
opc_rot_uxn_opcodes_h_l1016_c39_c351 : entity work.opc_rot_0CLK_4850ef50 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_c351_ins,
opc_rot_uxn_opcodes_h_l1016_c39_c351_k,
opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_e370
result_MUX_uxn_opcodes_h_l1017_c7_e370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_e370_cond,
result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_2567
opc_rot2_uxn_opcodes_h_l1017_c39_2567 : entity work.opc_rot2_0CLK_49c1023c port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_2567_k,
opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_432b
result_MUX_uxn_opcodes_h_l1018_c7_432b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_432b_cond,
result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_de19
opc_dup_uxn_opcodes_h_l1018_c39_de19 : entity work.opc_dup_0CLK_dd62d56e port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_de19_ins,
opc_dup_uxn_opcodes_h_l1018_c39_de19_k,
opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_4478
result_MUX_uxn_opcodes_h_l1019_c7_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_4478_cond,
result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_abe6
opc_dup2_uxn_opcodes_h_l1019_c39_abe6 : entity work.opc_dup2_0CLK_c8878770 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k,
opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_07a2
result_MUX_uxn_opcodes_h_l1020_c7_07a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond,
result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_477a
opc_ovr_uxn_opcodes_h_l1020_c39_477a : entity work.opc_ovr_0CLK_09d9764c port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_477a_k,
opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_f251
result_MUX_uxn_opcodes_h_l1021_c7_f251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_f251_cond,
result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_36df
opc_ovr2_uxn_opcodes_h_l1021_c39_36df : entity work.opc_ovr2_0CLK_3d799363 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_eccc
result_MUX_uxn_opcodes_h_l1022_c7_eccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond,
result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_393b
opc_equ_uxn_opcodes_h_l1022_c39_393b : entity work.opc_equ_0CLK_4bcf4f80 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_393b_ins,
opc_equ_uxn_opcodes_h_l1022_c39_393b_k,
opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_a62a
result_MUX_uxn_opcodes_h_l1023_c7_a62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond,
result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_6cd8
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8 : entity work.opc_equ2_0CLK_aa0f47c3 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k,
opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_ef40
result_MUX_uxn_opcodes_h_l1024_c7_ef40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond,
result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_3d99
opc_neq_uxn_opcodes_h_l1024_c39_3d99 : entity work.opc_neq_0CLK_4bcf4f80 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins,
opc_neq_uxn_opcodes_h_l1024_c39_3d99_k,
opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_cc58
result_MUX_uxn_opcodes_h_l1025_c7_cc58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond,
result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_39c7
opc_neq2_uxn_opcodes_h_l1025_c39_39c7 : entity work.opc_neq2_0CLK_aa0f47c3 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k,
opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_a337
result_MUX_uxn_opcodes_h_l1026_c7_a337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_a337_cond,
result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_433e
opc_gth_uxn_opcodes_h_l1026_c39_433e : entity work.opc_gth_0CLK_4bcf4f80 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_433e_ins,
opc_gth_uxn_opcodes_h_l1026_c39_433e_k,
opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_494c
result_MUX_uxn_opcodes_h_l1027_c7_494c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_494c_cond,
result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_0f20
opc_gth2_uxn_opcodes_h_l1027_c39_0f20 : entity work.opc_gth2_0CLK_aa0f47c3 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k,
opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_b77d
result_MUX_uxn_opcodes_h_l1028_c7_b77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond,
result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_e5d6
opc_lth_uxn_opcodes_h_l1028_c39_e5d6 : entity work.opc_lth_0CLK_4bcf4f80 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins,
opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k,
opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_9880
result_MUX_uxn_opcodes_h_l1029_c7_9880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_9880_cond,
result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_b227
opc_lth2_uxn_opcodes_h_l1029_c39_b227 : entity work.opc_lth2_0CLK_aa0f47c3 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_b227_k,
opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_b7dc
result_MUX_uxn_opcodes_h_l1030_c7_b7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond,
result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_80bf
opc_jmp_uxn_opcodes_h_l1030_c39_80bf : entity work.opc_jmp_0CLK_ab8f8397 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k,
opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_df51
result_MUX_uxn_opcodes_h_l1031_c7_df51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_df51_cond,
result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_84b5
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5 : entity work.opc_jmp2_0CLK_cd0ff700 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_415a
result_MUX_uxn_opcodes_h_l1032_c7_415a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_415a_cond,
result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_a428
opc_jcn_uxn_opcodes_h_l1032_c39_a428 : entity work.opc_jcn_0CLK_7f8adde9 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_a428_k,
opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_d371
result_MUX_uxn_opcodes_h_l1033_c7_d371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_d371_cond,
result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_589d
opc_jcn2_uxn_opcodes_h_l1033_c39_589d : entity work.opc_jcn2_0CLK_fc8f03ff port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_2364
result_MUX_uxn_opcodes_h_l1034_c7_2364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_2364_cond,
result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_c4df
opc_jsr_uxn_opcodes_h_l1034_c39_c4df : entity work.opc_jsr_0CLK_1d648d8a port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k,
opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_1d98
result_MUX_uxn_opcodes_h_l1035_c7_1d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond,
result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_ca25
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25 : entity work.opc_jsr2_0CLK_421159e4 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_d38b
result_MUX_uxn_opcodes_h_l1036_c7_d38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond,
result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_5fb7
opc_sth_uxn_opcodes_h_l1036_c39_5fb7 : entity work.opc_sth_0CLK_3ec49a15 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins,
opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k,
opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_6f42
result_MUX_uxn_opcodes_h_l1037_c7_6f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond,
result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_4e09
opc_sth2_uxn_opcodes_h_l1037_c39_4e09 : entity work.opc_sth2_0CLK_186906f2 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k,
opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_af4b
result_MUX_uxn_opcodes_h_l1038_c7_af4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond,
result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_c967
opc_ldz_uxn_opcodes_h_l1038_c39_c967 : entity work.opc_ldz_0CLK_7041f0d4 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_c967_k,
opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_0c06
result_MUX_uxn_opcodes_h_l1039_c7_0c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond,
result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_9932
opc_ldz2_uxn_opcodes_h_l1039_c39_9932 : entity work.opc_ldz2_0CLK_7c39c135 port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_1941
result_MUX_uxn_opcodes_h_l1040_c7_1941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_1941_cond,
result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_e0d8
opc_stz_uxn_opcodes_h_l1040_c39_e0d8 : entity work.opc_stz_0CLK_b96dbee9 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins,
opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k,
opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_d9b5
result_MUX_uxn_opcodes_h_l1041_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond,
result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_9dfd
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd : entity work.opc_stz2_0CLK_4d96a8bf port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k,
opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_8398
result_MUX_uxn_opcodes_h_l1042_c7_8398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_8398_cond,
result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_90b2
opc_ldr_uxn_opcodes_h_l1042_c39_90b2 : entity work.opc_ldr_0CLK_82f21321 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k,
opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_2e99
result_MUX_uxn_opcodes_h_l1043_c7_2e99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond,
result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_ca53
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53 : entity work.opc_ldr2_0CLK_70d4381b port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_272c
result_MUX_uxn_opcodes_h_l1044_c7_272c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_272c_cond,
result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_2858
opc_str_uxn_opcodes_h_l1044_c39_2858 : entity work.opc_str_0CLK_312a4701 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_2858_ins,
opc_str_uxn_opcodes_h_l1044_c39_2858_k,
opc_str_uxn_opcodes_h_l1044_c39_2858_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_1ce1
result_MUX_uxn_opcodes_h_l1045_c7_1ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond,
result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_ffde
opc_str2_uxn_opcodes_h_l1045_c39_ffde : entity work.opc_str2_0CLK_9c90a87c port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins,
opc_str2_uxn_opcodes_h_l1045_c39_ffde_k,
opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_13a7
result_MUX_uxn_opcodes_h_l1046_c7_13a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond,
result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_5c99
opc_lda_uxn_opcodes_h_l1046_c39_5c99 : entity work.opc_lda_0CLK_bb6fd9ae port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins,
opc_lda_uxn_opcodes_h_l1046_c39_5c99_k,
opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_5251
result_MUX_uxn_opcodes_h_l1047_c7_5251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_5251_cond,
result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_1968
opc_lda2_uxn_opcodes_h_l1047_c39_1968 : entity work.opc_lda2_0CLK_92ff38d5 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_1968_k,
opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_0365
result_MUX_uxn_opcodes_h_l1048_c7_0365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_0365_cond,
result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_71d7
opc_sta_uxn_opcodes_h_l1048_c39_71d7 : entity work.opc_sta_0CLK_9debfd4d port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins,
opc_sta_uxn_opcodes_h_l1048_c39_71d7_k,
opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_1b9f
result_MUX_uxn_opcodes_h_l1049_c7_1b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond,
result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_a58c
opc_sta2_uxn_opcodes_h_l1049_c39_a58c : entity work.opc_sta2_0CLK_5153798f port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k,
opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_7675
result_MUX_uxn_opcodes_h_l1050_c7_7675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_7675_cond,
result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_472f
opc_dei_uxn_opcodes_h_l1050_c39_472f : entity work.opc_dei_0CLK_4cadf5f3 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_472f_ins,
opc_dei_uxn_opcodes_h_l1050_c39_472f_k,
opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_87d4
result_MUX_uxn_opcodes_h_l1051_c7_87d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond,
result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_48a0
opc_dei2_uxn_opcodes_h_l1051_c39_48a0 : entity work.opc_dei2_0CLK_1a8244c2 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k,
opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_50cb
result_MUX_uxn_opcodes_h_l1052_c7_50cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond,
result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_083e
opc_deo_uxn_opcodes_h_l1052_c39_083e : entity work.opc_deo_0CLK_434848af port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_083e_ins,
opc_deo_uxn_opcodes_h_l1052_c39_083e_k,
opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_ce28
result_MUX_uxn_opcodes_h_l1053_c7_ce28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond,
result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_dfac
opc_deo2_uxn_opcodes_h_l1053_c39_dfac : entity work.opc_deo2_0CLK_d7508b32 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k,
opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_50e9
result_MUX_uxn_opcodes_h_l1054_c7_50e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond,
result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_57ed
opc_add_uxn_opcodes_h_l1054_c39_57ed : entity work.opc_add_0CLK_fec2727b port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_57ed_ins,
opc_add_uxn_opcodes_h_l1054_c39_57ed_k,
opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_5baa
result_MUX_uxn_opcodes_h_l1055_c7_5baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond,
result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_2374
opc_add2_uxn_opcodes_h_l1055_c39_2374 : entity work.opc_add2_0CLK_3ec85585 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_2374_ins,
opc_add2_uxn_opcodes_h_l1055_c39_2374_k,
opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_0ece
result_MUX_uxn_opcodes_h_l1056_c7_0ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond,
result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_0095
opc_sub_uxn_opcodes_h_l1056_c39_0095 : entity work.opc_sub_0CLK_fec2727b port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_0095_ins,
opc_sub_uxn_opcodes_h_l1056_c39_0095_k,
opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_cf36
result_MUX_uxn_opcodes_h_l1057_c7_cf36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond,
result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_c7fb
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb : entity work.opc_sub2_0CLK_3ec85585 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k,
opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_3a3f
result_MUX_uxn_opcodes_h_l1058_c7_3a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond,
result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_041a
opc_mul_uxn_opcodes_h_l1058_c39_041a : entity work.opc_mul_0CLK_fec2727b port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_041a_ins,
opc_mul_uxn_opcodes_h_l1058_c39_041a_k,
opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_6f36
result_MUX_uxn_opcodes_h_l1059_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond,
result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_d24b
opc_mul2_uxn_opcodes_h_l1059_c39_d24b : entity work.opc_mul2_0CLK_3ec85585 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k,
opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_fb24
result_MUX_uxn_opcodes_h_l1060_c7_fb24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond,
result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_0e05
opc_div_uxn_opcodes_h_l1060_c39_0e05 : entity work.opc_div_0CLK_eff7b951 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_0e05_ins,
opc_div_uxn_opcodes_h_l1060_c39_0e05_k,
opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_ef7c
result_MUX_uxn_opcodes_h_l1061_c7_ef7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond,
result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_5b3e
opc_div2_uxn_opcodes_h_l1061_c39_5b3e : entity work.opc_div2_0CLK_e1a1d759 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins,
opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k,
opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_ca92
result_MUX_uxn_opcodes_h_l1062_c7_ca92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond,
result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_6954
opc_and_uxn_opcodes_h_l1062_c39_6954 : entity work.opc_and_0CLK_fec2727b port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_6954_ins,
opc_and_uxn_opcodes_h_l1062_c39_6954_k,
opc_and_uxn_opcodes_h_l1062_c39_6954_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_a4eb
result_MUX_uxn_opcodes_h_l1063_c7_a4eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond,
result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_c342
opc_and2_uxn_opcodes_h_l1063_c39_c342 : entity work.opc_and2_0CLK_3ec85585 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_c342_ins,
opc_and2_uxn_opcodes_h_l1063_c39_c342_k,
opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_1d26
result_MUX_uxn_opcodes_h_l1064_c7_1d26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond,
result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_3b83
opc_ora_uxn_opcodes_h_l1064_c39_3b83 : entity work.opc_ora_0CLK_fec2727b port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins,
opc_ora_uxn_opcodes_h_l1064_c39_3b83_k,
opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_4a1f
result_MUX_uxn_opcodes_h_l1065_c7_4a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond,
result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_b842
opc_ora2_uxn_opcodes_h_l1065_c39_b842 : entity work.opc_ora2_0CLK_3ec85585 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_b842_k,
opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_717b
result_MUX_uxn_opcodes_h_l1066_c7_717b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_717b_cond,
result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_6e2c
opc_eor_uxn_opcodes_h_l1066_c39_6e2c : entity work.opc_eor_0CLK_fec2727b port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins,
opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k,
opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_ad5e
result_MUX_uxn_opcodes_h_l1067_c7_ad5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond,
result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_620a
opc_eor2_uxn_opcodes_h_l1067_c39_620a : entity work.opc_eor2_0CLK_3ec85585 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_620a_k,
opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_d8a2
result_MUX_uxn_opcodes_h_l1068_c7_d8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond,
result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_ef33
opc_sft_uxn_opcodes_h_l1068_c39_ef33 : entity work.opc_sft_0CLK_db76791a port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins,
opc_sft_uxn_opcodes_h_l1068_c39_ef33_k,
opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_565b
result_MUX_uxn_opcodes_h_l1069_c7_565b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_565b_cond,
result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_26be
opc_sft2_uxn_opcodes_h_l1069_c39_26be : entity work.opc_sft2_0CLK_effe98ec port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_26be_k,
opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_2858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_6954_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output : unsigned(0 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right := to_unsigned(27, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right := to_unsigned(252, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right := to_unsigned(255, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right := to_unsigned(23, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right := to_unsigned(250, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right := to_unsigned(51, 6);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right := to_unsigned(41, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right := to_unsigned(253, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right := to_unsigned(251, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right := to_unsigned(249, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right := to_unsigned(57, 6);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9b10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_6723] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_87a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_87cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_861f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_456f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_aec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_a1fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e90f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_e4b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_53c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_890b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_8768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_2be8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_66e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_4502] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_e7ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_cdf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_4ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_793f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_5e5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_acfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_e57c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_3ba6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1cb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_3980] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_5a05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_9a18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_5f98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_5feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_bd0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_6fd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_326d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_aa2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_121a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_d396] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ba89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_46cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_add0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_6c01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_c080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_7dce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_7598] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_6010] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output := opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_34f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_2c09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_8e68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_47f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_29eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_671b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_6482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_7471] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_6dcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_1aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6313] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_8cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_ce10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_c389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_a192] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_065e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_88cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_d3a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_81c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_1586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_db49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_dbb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_82c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_1baa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_2ccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_f952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_8e68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_81c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_29eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b10_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_065e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1cb6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_47f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_a192_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e4b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ce10_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2be8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_2ccd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_1baa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_34f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_7598_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_6723_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_db49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_793f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_bd0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_326d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9f3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_7471_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_6dcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_82c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_cdf9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_6482_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_5e5f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_9a18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_121a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5a05_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_c080_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_8cce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_7dce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_d396_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_e57c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_aa2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5f98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6c01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_f952_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_a1fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_c389_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_88cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6313_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_3980_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_53c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_aec8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_dbb1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_4ded_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_890b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6fd4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2c09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_87cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_87a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1586_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_acfd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_46cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_e7ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_456f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8768_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_3ba6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_66e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_add0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_1aa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_5feb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_4502_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_671b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e90f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d3a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_861f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_6010_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_d85f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_58ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_9030] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_9030_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_0682] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_806b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output;

     -- opc_jci[uxn_opcodes_h_l1001_c39_494f] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output := opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_806b_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_0682_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_494f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_3c22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_628c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_48cc] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_628c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_48cc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_165b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_5765] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_3022] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_165b_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_5765_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_3022_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_e6e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_7775] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_aad8] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output := opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_7775_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_aad8_return_output;
     -- opc_lit2[uxn_opcodes_h_l1005_c39_6eea] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_b2f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_2fde] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_b2f7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_6eea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_309d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output;

     -- opc_litr[uxn_opcodes_h_l1006_c39_1364] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_1364_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output := opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_bb12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_309d_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bb12_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_1364_return_output;
     -- opc_lit2r[uxn_opcodes_h_l1007_c39_d429] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_14c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_1115] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_1115_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_14c3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_d429_return_output;
     -- opc_inc[uxn_opcodes_h_l1008_c39_fdb5] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output := opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_bd08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_2c4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_bd08_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_fdb5_return_output;
     -- opc_inc2[uxn_opcodes_h_l1009_c39_7fb6] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_2d27] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_5187] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_5187_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_7fb6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_6a09] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_0b24] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_0b24_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output := opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_5ce9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_6a09_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_0b24_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_2047] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_4b35] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output;

     -- opc_pop2[uxn_opcodes_h_l1011_c39_a00c] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_2047_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_a00c_return_output;
     -- opc_nip[uxn_opcodes_h_l1012_c39_00a1] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_00a1_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output := opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_6cd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_23b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_6cd8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_00a1_return_output;
     -- opc_nip2[uxn_opcodes_h_l1013_c39_a912] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_a912_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_2f2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_827f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_827f_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_2f2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a912_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_7407] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_dbad] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_dbad_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output := opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_ccbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_7407_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_ccbc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_dbad_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_e370] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_2354] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_2354_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_ccbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_e370_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_ccbc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_2354_return_output;
     -- opc_rot[uxn_opcodes_h_l1016_c39_c351] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_c351_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_c351_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output := opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_3693] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_432b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_432b_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3693_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_c351_return_output;
     -- opc_rot2[uxn_opcodes_h_l1017_c39_2567] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_2567_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_eac0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_4478] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_4478_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_eac0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_2567_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_98aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output;

     -- opc_dup[uxn_opcodes_h_l1018_c39_de19] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_de19_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_de19_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output := opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_07a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_98aa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_de19_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_f843] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_f251] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_abe6] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_f251_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_f843_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_abe6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_eccc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_477a] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_477a_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_a70d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_a70d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_477a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_b73a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_a62a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_36df] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b73a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_36df_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_746f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_ef40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_393b] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_393b_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_393b_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output := opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_746f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_393b_return_output;
     -- opc_equ2[uxn_opcodes_h_l1023_c39_6cd8] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_cc58] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_a4ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_a4ff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_6cd8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_f19e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_3d99] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_3d99_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output := opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_a337] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_a337_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f19e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_3d99_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_494c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_39c7] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_fdd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_494c_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_fdd4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_39c7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_7af1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_b77d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output;

     -- opc_gth[uxn_opcodes_h_l1026_c39_433e] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_433e_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_433e_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output := opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_7af1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_433e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_e634] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9880] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output;

     -- opc_gth2[uxn_opcodes_h_l1027_c39_0f20] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9880_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_e634_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_0f20_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_b7dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_2e9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_e5d6] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output := opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_2e9d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_e5d6_return_output;
     -- opc_lth2[uxn_opcodes_h_l1029_c39_b227] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_b227_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_d82a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_df51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_df51_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_d82a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b227_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_415a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_80bf] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_5714] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_415a_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_5714_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_80bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_d371] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_18af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_84b5] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_d371_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_18af_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_84b5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_2364] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_a428] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_a428_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_b1d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_2364_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_b1d4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_a428_return_output;
     -- opc_jcn2[uxn_opcodes_h_l1033_c39_589d] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_501d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_1d98] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_501d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_589d_return_output;
     -- opc_jsr[uxn_opcodes_h_l1034_c39_c4df] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_b2ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d38b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_b2ae_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c4df_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_6f42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_ca25] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_f1a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f1a1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_ca25_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_f78b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_af4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_5fb7] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output := opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_f78b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_5fb7_return_output;
     -- opc_sth2[uxn_opcodes_h_l1037_c39_4e09] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_0c06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_8971] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_8971_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_4e09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_b6d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_1941] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output;

     -- opc_ldz[uxn_opcodes_h_l1038_c39_c967] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_c967_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_1941_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_b6d7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_c967_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_d9b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_34d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_9932] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_34d9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_9932_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_8398] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_a1ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_e0d8] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output := opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_8398_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_a1ea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_e0d8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_2e99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_ffb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_9dfd] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ffb9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_9dfd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_272c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_90b2] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_2bdf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_272c_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_2bdf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_90b2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_c564] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_1ce1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_ca53] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c564_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_ca53_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_858d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_13a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_2858] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_2858_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_ins;
     opc_str_uxn_opcodes_h_l1044_c39_2858_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_return_output := opc_str_uxn_opcodes_h_l1044_c39_2858_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_858d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_2858_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_5251] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_ffde] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_ffde_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output := opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_a363] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_5251_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_a363_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_ffde_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_0365] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_830c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_5c99] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_5c99_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output := opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_0365_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_830c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_5c99_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_1b9f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_01cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output;

     -- opc_lda2[uxn_opcodes_h_l1047_c39_1968] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_1968_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_01cb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_1968_return_output;
     -- opc_sta[uxn_opcodes_h_l1048_c39_71d7] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_71d7_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output := opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_7675] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_749e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_7675_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_749e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_71d7_return_output;
     -- opc_sta2[uxn_opcodes_h_l1049_c39_a58c] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_87d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_da6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_da6b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_a58c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_7f57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output;

     -- opc_dei[uxn_opcodes_h_l1050_c39_472f] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_472f_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_472f_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output := opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_50cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_7f57_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_472f_return_output;
     -- opc_dei2[uxn_opcodes_h_l1051_c39_48a0] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_9fa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_ce28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9fa0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_48a0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_9eaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_50e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output;

     -- opc_deo[uxn_opcodes_h_l1052_c39_083e] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_083e_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_083e_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output := opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_9eaa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_083e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_5baa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_dfac] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_73b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_73b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_dfac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_122d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_0ece] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_57ed] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_57ed_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_ins;
     opc_add_uxn_opcodes_h_l1054_c39_57ed_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output := opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_122d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_57ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_cf36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_4c5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_2374] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_2374_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_2374_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output := opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_4c5f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_2374_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_3a3f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_d0dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_0095] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_0095_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_0095_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output := opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_d0dc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_0095_return_output;
     -- opc_sub2[uxn_opcodes_h_l1057_c39_c7fb] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_5310] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_6f36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_5310_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_c7fb_return_output;
     -- opc_mul[uxn_opcodes_h_l1058_c39_041a] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_041a_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_041a_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output := opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_bf39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_fb24] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_bf39_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_041a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_a62a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_d24b] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_ef7c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a62a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d24b_return_output;
     -- opc_div[uxn_opcodes_h_l1060_c39_0e05] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_0e05_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_ins;
     opc_div_uxn_opcodes_h_l1060_c39_0e05_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output := opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_7c58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_ca92] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_7c58_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_0e05_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_a4eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_aecd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_5b3e] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output := opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_aecd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_5b3e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_1d26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_6954] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_6954_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_ins;
     opc_and_uxn_opcodes_h_l1062_c39_6954_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_return_output := opc_and_uxn_opcodes_h_l1062_c39_6954_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_9218] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_9218_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_6954_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_4a1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_c342] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_c342_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_c342_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output := opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_b80c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_b80c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_c342_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_e322] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_3b83] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_3b83_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output := opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_717b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_717b_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_e322_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_3b83_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_02f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output;

     -- opc_ora2[uxn_opcodes_h_l1065_c39_b842] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_b842_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_ad5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_02f8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_b842_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_fb9f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_d8a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output;

     -- opc_eor[uxn_opcodes_h_l1066_c39_6e2c] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output := opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_fb9f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_6e2c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_39b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_565b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output;

     -- opc_eor2[uxn_opcodes_h_l1067_c39_620a] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_620a_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_565b_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_39b0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_620a_return_output;
     -- opc_sft[uxn_opcodes_h_l1068_c39_ef33] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_ef33_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output := opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_a3ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_ef33_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_26be] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_26be_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_26be_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_565b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_565b_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output := result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_565b_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_d8a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output := result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_d8a2_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_ad5e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output := result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_ad5e_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_717b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_717b_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output := result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_717b_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_4a1f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output := result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_4a1f_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_1d26] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output := result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_1d26_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_a4eb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output := result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_a4eb_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_ca92] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output := result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_ca92_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_ef7c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output := result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_ef7c_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_fb24] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output := result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_fb24_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_6f36] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output := result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_6f36_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_3a3f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output := result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_3a3f_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_cf36] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output := result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_cf36_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_0ece] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output := result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_0ece_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_5baa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output := result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_5baa_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_50e9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output := result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_50e9_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_ce28] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output := result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_ce28_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_50cb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output := result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_50cb_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_87d4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output := result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_87d4_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_7675] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_7675_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output := result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_7675_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_1b9f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output := result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_1b9f_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_0365] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_0365_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output := result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_0365_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_5251] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_5251_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output := result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_5251_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_13a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output := result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_13a7_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_1ce1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output := result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_1ce1_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_272c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_272c_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output := result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_272c_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_2e99] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output := result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_2e99_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_8398] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_8398_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output := result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_8398_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_d9b5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output := result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_d9b5_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_1941] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_1941_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output := result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_1941_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_0c06] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output := result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_0c06_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_af4b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output := result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_af4b_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_6f42] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output := result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_6f42_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_d38b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output := result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_d38b_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_1d98] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output := result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_1d98_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_2364] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_2364_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output := result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_2364_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_d371] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_d371_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output := result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_d371_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_415a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_415a_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output := result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_415a_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_df51] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_df51_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output := result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_df51_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_b7dc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output := result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_b7dc_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_9880] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_9880_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output := result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_9880_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_b77d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output := result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_b77d_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_494c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_494c_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output := result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_494c_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_a337] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_a337_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output := result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_a337_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_cc58] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output := result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_cc58_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_ef40] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output := result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_ef40_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_a62a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output := result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_a62a_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_eccc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output := result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_eccc_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_f251] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_f251_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output := result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_f251_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_07a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output := result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_07a2_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_4478] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_4478_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output := result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_4478_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_432b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_432b_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output := result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_432b_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_e370] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_e370_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output := result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_e370_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_7407] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_7407_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output := result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_7407_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_827f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_827f_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output := result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_827f_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_23b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output := result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_23b6_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_4b35] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output := result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_4b35_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_5ce9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output := result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_5ce9_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_2d27] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output := result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_2d27_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_2c4d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output := result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_2c4d_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_1115] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_1115_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output := result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_1115_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_309d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_309d_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output := result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_309d_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_2fde] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output := result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_2fde_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_e6e5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output := result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_e6e5_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_165b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_165b_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output := result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_165b_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_3c22] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output := result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_3c22_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_806b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_806b_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output := result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_806b_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_58ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output := result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_58ee_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_d85f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output := result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_d85f_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_b9a4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output := result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_b9a4_return_output;
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
