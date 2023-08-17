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
entity eval_opcode_0CLK_1e9868e1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_1e9868e1;
architecture arch of eval_opcode_0CLK_1e9868e1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_b4a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_2228]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_5e83]
signal result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_2dd2]
signal opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_0728]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_1d6e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_38cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_2228]
signal result_MUX_uxn_opcodes_h_l1001_c7_2228_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_955e]
signal opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_b644]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_3fd5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_67cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_38cb]
signal result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_7bee]
signal opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_0bcb]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3729]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_5911]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_67cc]
signal result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_6942]
signal opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_b362]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_4619]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_62cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_5911]
signal result_MUX_uxn_opcodes_h_l1004_c7_5911_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_5ad0]
signal opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_c041]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_b99d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_3987]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_62cf]
signal result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_e845]
signal opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_0d69]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_dd6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_b5d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_3987]
signal result_MUX_uxn_opcodes_h_l1006_c7_3987_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_f426]
signal opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_f426_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_608a]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_2746]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_13c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_b5d4]
signal result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_9cf3]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_037c]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_a502]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_aee0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_13c5]
signal result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_7a91]
signal opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_7a91_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_e812]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_60dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_19d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_aee0]
signal result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_b86e]
signal opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_88eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_58e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_305f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_19d6]
signal result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_f81f]
signal opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_f81f_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_9c4f]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_b002]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_3529]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_305f]
signal result_MUX_uxn_opcodes_h_l1011_c7_305f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_1057]
signal opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_1057_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_68f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_0f2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_a6c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_3529]
signal result_MUX_uxn_opcodes_h_l1012_c7_3529_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_7d4a]
signal opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_f361]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_b797]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_fd10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_a6c0]
signal result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_03a9]
signal opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_522d]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_ee10]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_5e14]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_fd10]
signal result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_4fe5]
signal opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_2a71]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_944a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_f5db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_5e14]
signal result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_d151]
signal opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_d151_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_b7d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_fc57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_46c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_f5db]
signal result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_e0bf]
signal opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_c81b]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_3022]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_c9a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_46c8]
signal result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_75c8]
signal opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_3e92]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_789c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_220a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_c9a0]
signal result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_4cd3]
signal opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_850c]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_c0bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_499c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_220a]
signal result_MUX_uxn_opcodes_h_l1019_c7_220a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_de08]
signal opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_de08_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_a7f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_7e28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_8123]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_499c]
signal result_MUX_uxn_opcodes_h_l1020_c7_499c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_4324]
signal opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_4324_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_15ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_8746]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_adfb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_8123]
signal result_MUX_uxn_opcodes_h_l1021_c7_8123_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_bb56]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_06f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_586b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_d1e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_adfb]
signal result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_ea4f]
signal opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_73a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_2a8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_bed2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_d1e3]
signal result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_def2]
signal opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_def2_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_5989]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_aa56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_6dac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_bed2]
signal result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_a755]
signal opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_a755_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_a755_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_713c]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_2a92]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_d311]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_6dac]
signal result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_ec1e]
signal opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_293b]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4d98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_143c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_d311]
signal result_MUX_uxn_opcodes_h_l1026_c7_d311_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_f90e]
signal opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f90e_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_c468]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_a279]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_cfd4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_143c]
signal result_MUX_uxn_opcodes_h_l1027_c7_143c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_63c0]
signal opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_053c]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_9980]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_661b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_cfd4]
signal result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_8cb2]
signal opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_4e15]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_407a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_6994]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_661b]
signal result_MUX_uxn_opcodes_h_l1029_c7_661b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_493a]
signal opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_493a_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_f175]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_1476]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d468]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_6994]
signal result_MUX_uxn_opcodes_h_l1030_c7_6994_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_0e05]
signal opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_370c]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_7b9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_487e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_d468]
signal result_MUX_uxn_opcodes_h_l1031_c7_d468_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_c65b]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_d560]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_2c4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_61a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_487e]
signal result_MUX_uxn_opcodes_h_l1032_c7_487e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_5641]
signal opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_5641_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_a62f]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_5991]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_1697]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_61a0]
signal result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_447c]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_acbb]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_cd69]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_7d9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_1697]
signal result_MUX_uxn_opcodes_h_l1034_c7_1697_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_c2de]
signal opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_3e6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_3476]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d55d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_7d9a]
signal result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_b442]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_0982]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_79de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_1afd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_d55d]
signal result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_24ef]
signal opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_24ef_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_c805]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_fe56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_c658]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_1afd]
signal result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_f57f]
signal opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_22f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_f1fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_6c4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_c658]
signal result_MUX_uxn_opcodes_h_l1038_c7_c658_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_5c7c]
signal opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_cfae]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_fec7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_e6e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_6c4c]
signal result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_8ee5]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_53d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_933a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_9ecc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_e6e1]
signal result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_9d85]
signal opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_9d85_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_7919]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_8403]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_402a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_9ecc]
signal result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_18a2]
signal opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_5d93]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_940c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_7238]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_402a]
signal result_MUX_uxn_opcodes_h_l1042_c7_402a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_0a24]
signal opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_083b]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_bff1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_cf75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_7238]
signal result_MUX_uxn_opcodes_h_l1043_c7_7238_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_b25c]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_88ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_f4e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_64ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_cf75]
signal result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_1bf3]
signal opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_1bf3_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_b027]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_c4f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_4d56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_64ff]
signal result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_1ca9]
signal opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_771b]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_8055]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_eccc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_4d56]
signal result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_24d9]
signal opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_24d9_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_5dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_1e0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_2b7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_eccc]
signal result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_6853]
signal opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_6853_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_7f64]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_73fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_6ef7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_2b7f]
signal result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_f964]
signal opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f964_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f964_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_74f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_a0b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_f298]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_6ef7]
signal result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_bf9d]
signal opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_1682]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_0bca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_fdc7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_f298]
signal result_MUX_uxn_opcodes_h_l1050_c7_f298_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_a1d1]
signal opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_14be]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_9d13]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_5d5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_fdc7]
signal result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_5119]
signal opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_5119_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_20b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_10f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_2717]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_5d5d]
signal result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_caa5]
signal opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_caa5_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_6a29]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_a0b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_375c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_2717]
signal result_MUX_uxn_opcodes_h_l1053_c7_2717_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_8a68]
signal opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_af45]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_2efc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_ca30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_375c]
signal result_MUX_uxn_opcodes_h_l1054_c7_375c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_8aeb]
signal opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_8aeb_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_be9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_da52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_3694]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_ca30]
signal result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_5e7a]
signal opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_41e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_7c08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_b51d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_3694]
signal result_MUX_uxn_opcodes_h_l1056_c7_3694_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_8963]
signal opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_8963_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_8963_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_54ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_5cf0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_426d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_b51d]
signal result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_a505]
signal opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_a505_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_6876]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_f42c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_c192]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_426d]
signal result_MUX_uxn_opcodes_h_l1058_c7_426d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_8792]
signal opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8792_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8792_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_a9ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_7ba0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_cf26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_c192]
signal result_MUX_uxn_opcodes_h_l1059_c7_c192_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_6862]
signal opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_6862_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_e1dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_02fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_7173]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_cf26]
signal result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_5138]
signal opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_5138_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_5138_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_5138_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_14a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_9f1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_27d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_7173]
signal result_MUX_uxn_opcodes_h_l1061_c7_7173_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_d696]
signal opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d696_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d696_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_f596]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_9b99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_8290]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_27d3]
signal result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_dcf7]
signal opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_dcf7_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_6fc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_eae3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_57c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_8290]
signal result_MUX_uxn_opcodes_h_l1063_c7_8290_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_a125]
signal opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a125_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a125_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_4140]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_6c68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_903b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_57c5]
signal result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_f3c6]
signal opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_bed0]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_02c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_b989]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_903b]
signal result_MUX_uxn_opcodes_h_l1065_c7_903b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_44e9]
signal opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_88d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_0b38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_0a31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_b989]
signal result_MUX_uxn_opcodes_h_l1066_c7_b989_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_cdc6]
signal opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_7f55]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_5a48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_2f42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_0a31]
signal result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_8e88]
signal opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_bdca]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_0c5b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_c4bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_2f42]
signal result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_2c9f]
signal opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_5be7]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_092b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_c4bf]
signal result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_3300]
signal opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_3300_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_5e83
result_MUX_uxn_opcodes_h_l1000_c2_5e83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond,
result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_2dd2
opc_brk_uxn_opcodes_h_l1000_c34_2dd2 : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_2228
result_MUX_uxn_opcodes_h_l1001_c7_2228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_2228_cond,
result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_955e
opc_jci_uxn_opcodes_h_l1001_c39_955e : entity work.opc_jci_0CLK_48621097 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_38cb
result_MUX_uxn_opcodes_h_l1002_c7_38cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond,
result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_7bee
opc_jmi_uxn_opcodes_h_l1002_c39_7bee : entity work.opc_jmi_0CLK_8329ae76 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_67cc
result_MUX_uxn_opcodes_h_l1003_c7_67cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond,
result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_6942
opc_jsi_uxn_opcodes_h_l1003_c39_6942 : entity work.opc_jsi_0CLK_654f76ad port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_5911
result_MUX_uxn_opcodes_h_l1004_c7_5911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_5911_cond,
result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_5ad0
opc_lit_uxn_opcodes_h_l1004_c39_5ad0 : entity work.opc_lit_0CLK_91765130 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins,
opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_62cf
result_MUX_uxn_opcodes_h_l1005_c7_62cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond,
result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_e845
opc_lit2_uxn_opcodes_h_l1005_c39_e845 : entity work.opc_lit2_0CLK_5771c2e7 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_3987
result_MUX_uxn_opcodes_h_l1006_c7_3987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_3987_cond,
result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_f426
opc_litr_uxn_opcodes_h_l1006_c39_f426 : entity work.opc_litr_0CLK_91765130 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_f426_ins,
opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_b5d4
result_MUX_uxn_opcodes_h_l1007_c7_b5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond,
result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3
opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3 : entity work.opc_lit2r_0CLK_5771c2e7 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_13c5
result_MUX_uxn_opcodes_h_l1008_c7_13c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond,
result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_7a91
opc_inc_uxn_opcodes_h_l1008_c39_7a91 : entity work.opc_inc_0CLK_527859ed port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins,
opc_inc_uxn_opcodes_h_l1008_c39_7a91_k,
opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_aee0
result_MUX_uxn_opcodes_h_l1009_c7_aee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond,
result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_b86e
opc_inc2_uxn_opcodes_h_l1009_c39_b86e : entity work.opc_inc2_0CLK_406fd05a port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k,
opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_19d6
result_MUX_uxn_opcodes_h_l1010_c7_19d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond,
result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_f81f
opc_pop_uxn_opcodes_h_l1010_c39_f81f : entity work.opc_pop_0CLK_b8481ba4 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins,
opc_pop_uxn_opcodes_h_l1010_c39_f81f_k,
opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_305f
result_MUX_uxn_opcodes_h_l1011_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_305f_cond,
result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_1057
opc_pop2_uxn_opcodes_h_l1011_c39_1057 : entity work.opc_pop2_0CLK_b8481ba4 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_1057_k,
opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_3529
result_MUX_uxn_opcodes_h_l1012_c7_3529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_3529_cond,
result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_7d4a
opc_nip_uxn_opcodes_h_l1012_c39_7d4a : entity work.opc_nip_0CLK_9628671b port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins,
opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k,
opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_a6c0
result_MUX_uxn_opcodes_h_l1013_c7_a6c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond,
result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_03a9
opc_nip2_uxn_opcodes_h_l1013_c39_03a9 : entity work.opc_nip2_0CLK_f28f4c7a port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k,
opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_fd10
result_MUX_uxn_opcodes_h_l1014_c7_fd10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond,
result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_4fe5
opc_swp_uxn_opcodes_h_l1014_c39_4fe5 : entity work.opc_swp_0CLK_83cf382a port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins,
opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k,
opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_5e14
result_MUX_uxn_opcodes_h_l1015_c7_5e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond,
result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_d151
opc_swp2_uxn_opcodes_h_l1015_c39_d151 : entity work.opc_swp2_0CLK_0c7179a6 port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_d151_k,
opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_f5db
result_MUX_uxn_opcodes_h_l1016_c7_f5db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond,
result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_e0bf
opc_rot_uxn_opcodes_h_l1016_c39_e0bf : entity work.opc_rot_0CLK_a2a05350 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins,
opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k,
opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_46c8
result_MUX_uxn_opcodes_h_l1017_c7_46c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond,
result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_75c8
opc_rot2_uxn_opcodes_h_l1017_c39_75c8 : entity work.opc_rot2_0CLK_0ca1079f port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k,
opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_c9a0
result_MUX_uxn_opcodes_h_l1018_c7_c9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond,
result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_4cd3
opc_dup_uxn_opcodes_h_l1018_c39_4cd3 : entity work.opc_dup_0CLK_86b8f17f port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins,
opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k,
opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_220a
result_MUX_uxn_opcodes_h_l1019_c7_220a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_220a_cond,
result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_de08
opc_dup2_uxn_opcodes_h_l1019_c39_de08 : entity work.opc_dup2_0CLK_af1ee9cd port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_de08_k,
opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_499c
result_MUX_uxn_opcodes_h_l1020_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_499c_cond,
result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_4324
opc_ovr_uxn_opcodes_h_l1020_c39_4324 : entity work.opc_ovr_0CLK_fc9c1bff port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_4324_k,
opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_8123
result_MUX_uxn_opcodes_h_l1021_c7_8123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_8123_cond,
result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_bb56
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56 : entity work.opc_ovr2_0CLK_fb62ff38 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_adfb
result_MUX_uxn_opcodes_h_l1022_c7_adfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond,
result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_ea4f
opc_equ_uxn_opcodes_h_l1022_c39_ea4f : entity work.opc_equ_0CLK_c0e2cdea port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins,
opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k,
opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_d1e3
result_MUX_uxn_opcodes_h_l1023_c7_d1e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond,
result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_def2
opc_equ2_uxn_opcodes_h_l1023_c39_def2 : entity work.opc_equ2_0CLK_21f39cb0 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_def2_k,
opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_bed2
result_MUX_uxn_opcodes_h_l1024_c7_bed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond,
result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_a755
opc_neq_uxn_opcodes_h_l1024_c39_a755 : entity work.opc_neq_0CLK_c0e2cdea port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_a755_ins,
opc_neq_uxn_opcodes_h_l1024_c39_a755_k,
opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_6dac
result_MUX_uxn_opcodes_h_l1025_c7_6dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond,
result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_ec1e
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e : entity work.opc_neq2_0CLK_21f39cb0 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k,
opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_d311
result_MUX_uxn_opcodes_h_l1026_c7_d311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_d311_cond,
result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_f90e
opc_gth_uxn_opcodes_h_l1026_c39_f90e : entity work.opc_gth_0CLK_c0e2cdea port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins,
opc_gth_uxn_opcodes_h_l1026_c39_f90e_k,
opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_143c
result_MUX_uxn_opcodes_h_l1027_c7_143c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_143c_cond,
result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_63c0
opc_gth2_uxn_opcodes_h_l1027_c39_63c0 : entity work.opc_gth2_0CLK_21f39cb0 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k,
opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_cfd4
result_MUX_uxn_opcodes_h_l1028_c7_cfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond,
result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_8cb2
opc_lth_uxn_opcodes_h_l1028_c39_8cb2 : entity work.opc_lth_0CLK_c0e2cdea port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins,
opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k,
opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_661b
result_MUX_uxn_opcodes_h_l1029_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_661b_cond,
result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_493a
opc_lth2_uxn_opcodes_h_l1029_c39_493a : entity work.opc_lth2_0CLK_21f39cb0 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_493a_k,
opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_6994
result_MUX_uxn_opcodes_h_l1030_c7_6994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_6994_cond,
result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_0e05
opc_jmp_uxn_opcodes_h_l1030_c39_0e05 : entity work.opc_jmp_0CLK_40773879 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k,
opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_d468
result_MUX_uxn_opcodes_h_l1031_c7_d468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_d468_cond,
result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_c65b
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b : entity work.opc_jmp2_0CLK_3a2d478d port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_487e
result_MUX_uxn_opcodes_h_l1032_c7_487e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_487e_cond,
result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_5641
opc_jcn_uxn_opcodes_h_l1032_c39_5641 : entity work.opc_jcn_0CLK_dfb9cfec port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_5641_k,
opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_61a0
result_MUX_uxn_opcodes_h_l1033_c7_61a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond,
result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_447c
opc_jcn2_uxn_opcodes_h_l1033_c39_447c : entity work.opc_jcn2_0CLK_edc0dd3d port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_1697
result_MUX_uxn_opcodes_h_l1034_c7_1697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_1697_cond,
result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_c2de
opc_jsr_uxn_opcodes_h_l1034_c39_c2de : entity work.opc_jsr_0CLK_a5f05dbb port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k,
opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_7d9a
result_MUX_uxn_opcodes_h_l1035_c7_7d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond,
result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_b442
opc_jsr2_uxn_opcodes_h_l1035_c39_b442 : entity work.opc_jsr2_0CLK_38d4772b port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_d55d
result_MUX_uxn_opcodes_h_l1036_c7_d55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond,
result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_24ef
opc_sth_uxn_opcodes_h_l1036_c39_24ef : entity work.opc_sth_0CLK_39928647 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins,
opc_sth_uxn_opcodes_h_l1036_c39_24ef_k,
opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_1afd
result_MUX_uxn_opcodes_h_l1037_c7_1afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond,
result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_f57f
opc_sth2_uxn_opcodes_h_l1037_c39_f57f : entity work.opc_sth2_0CLK_4273dea9 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k,
opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_c658
result_MUX_uxn_opcodes_h_l1038_c7_c658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_c658_cond,
result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_5c7c
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c : entity work.opc_ldz_0CLK_c92d293d port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k,
opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_6c4c
result_MUX_uxn_opcodes_h_l1039_c7_6c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond,
result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5 : entity work.opc_ldz2_0CLK_4f7f846d port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_e6e1
result_MUX_uxn_opcodes_h_l1040_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond,
result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_9d85
opc_stz_uxn_opcodes_h_l1040_c39_9d85 : entity work.opc_stz_0CLK_2f00d2b5 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins,
opc_stz_uxn_opcodes_h_l1040_c39_9d85_k,
opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_9ecc
result_MUX_uxn_opcodes_h_l1041_c7_9ecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond,
result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_18a2
opc_stz2_uxn_opcodes_h_l1041_c39_18a2 : entity work.opc_stz2_0CLK_b713ac82 port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k,
opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_402a
result_MUX_uxn_opcodes_h_l1042_c7_402a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_402a_cond,
result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_0a24
opc_ldr_uxn_opcodes_h_l1042_c39_0a24 : entity work.opc_ldr_0CLK_a3d504a6 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k,
opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_7238
result_MUX_uxn_opcodes_h_l1043_c7_7238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_7238_cond,
result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_b25c
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c : entity work.opc_ldr2_0CLK_a1d1deb3 port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_cf75
result_MUX_uxn_opcodes_h_l1044_c7_cf75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond,
result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_1bf3
opc_str_uxn_opcodes_h_l1044_c39_1bf3 : entity work.opc_str_0CLK_d7121cd1 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins,
opc_str_uxn_opcodes_h_l1044_c39_1bf3_k,
opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_64ff
result_MUX_uxn_opcodes_h_l1045_c7_64ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond,
result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_1ca9
opc_str2_uxn_opcodes_h_l1045_c39_1ca9 : entity work.opc_str2_0CLK_ba9e7521 port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins,
opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k,
opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_4d56
result_MUX_uxn_opcodes_h_l1046_c7_4d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond,
result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_24d9
opc_lda_uxn_opcodes_h_l1046_c39_24d9 : entity work.opc_lda_0CLK_aac38276 port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins,
opc_lda_uxn_opcodes_h_l1046_c39_24d9_k,
opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_eccc
result_MUX_uxn_opcodes_h_l1047_c7_eccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond,
result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_6853
opc_lda2_uxn_opcodes_h_l1047_c39_6853 : entity work.opc_lda2_0CLK_aac38276 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_6853_k,
opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_2b7f
result_MUX_uxn_opcodes_h_l1048_c7_2b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond,
result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_f964
opc_sta_uxn_opcodes_h_l1048_c39_f964 : entity work.opc_sta_0CLK_340bf904 port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_f964_ins,
opc_sta_uxn_opcodes_h_l1048_c39_f964_k,
opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_6ef7
result_MUX_uxn_opcodes_h_l1049_c7_6ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond,
result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_bf9d
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d : entity work.opc_sta2_0CLK_13d68893 port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k,
opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_f298
result_MUX_uxn_opcodes_h_l1050_c7_f298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_f298_cond,
result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_a1d1
opc_dei_uxn_opcodes_h_l1050_c39_a1d1 : entity work.opc_dei_0CLK_8c920d8c port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins,
opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k,
opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_fdc7
result_MUX_uxn_opcodes_h_l1051_c7_fdc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond,
result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_5119
opc_dei2_uxn_opcodes_h_l1051_c39_5119 : entity work.opc_dei2_0CLK_aa33bb56 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_5119_k,
opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_5d5d
result_MUX_uxn_opcodes_h_l1052_c7_5d5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond,
result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_caa5
opc_deo_uxn_opcodes_h_l1052_c39_caa5 : entity work.opc_deo_0CLK_e769fab0 port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins,
opc_deo_uxn_opcodes_h_l1052_c39_caa5_k,
opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_2717
result_MUX_uxn_opcodes_h_l1053_c7_2717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_2717_cond,
result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_8a68
opc_deo2_uxn_opcodes_h_l1053_c39_8a68 : entity work.opc_deo2_0CLK_5a899f0d port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k,
opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_375c
result_MUX_uxn_opcodes_h_l1054_c7_375c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_375c_cond,
result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_8aeb
opc_add_uxn_opcodes_h_l1054_c39_8aeb : entity work.opc_add_0CLK_f3e79dfa port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins,
opc_add_uxn_opcodes_h_l1054_c39_8aeb_k,
opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_ca30
result_MUX_uxn_opcodes_h_l1055_c7_ca30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond,
result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_5e7a
opc_add2_uxn_opcodes_h_l1055_c39_5e7a : entity work.opc_add2_0CLK_3c565289 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins,
opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k,
opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_3694
result_MUX_uxn_opcodes_h_l1056_c7_3694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_3694_cond,
result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_8963
opc_sub_uxn_opcodes_h_l1056_c39_8963 : entity work.opc_sub_0CLK_f3e79dfa port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_8963_ins,
opc_sub_uxn_opcodes_h_l1056_c39_8963_k,
opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_b51d
result_MUX_uxn_opcodes_h_l1057_c7_b51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond,
result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_a505
opc_sub2_uxn_opcodes_h_l1057_c39_a505 : entity work.opc_sub2_0CLK_3c565289 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_a505_k,
opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_426d
result_MUX_uxn_opcodes_h_l1058_c7_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_426d_cond,
result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_8792
opc_mul_uxn_opcodes_h_l1058_c39_8792 : entity work.opc_mul_0CLK_f3e79dfa port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_8792_ins,
opc_mul_uxn_opcodes_h_l1058_c39_8792_k,
opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_c192
result_MUX_uxn_opcodes_h_l1059_c7_c192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_c192_cond,
result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_6862
opc_mul2_uxn_opcodes_h_l1059_c39_6862 : entity work.opc_mul2_0CLK_3c565289 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_6862_k,
opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_cf26
result_MUX_uxn_opcodes_h_l1060_c7_cf26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond,
result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_5138
opc_div_uxn_opcodes_h_l1060_c39_5138 : entity work.opc_div_0CLK_98c80258 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_5138_ins,
opc_div_uxn_opcodes_h_l1060_c39_5138_k,
opc_div_uxn_opcodes_h_l1060_c39_5138_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_7173
result_MUX_uxn_opcodes_h_l1061_c7_7173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_7173_cond,
result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_d696
opc_div2_uxn_opcodes_h_l1061_c39_d696 : entity work.opc_div2_0CLK_6a02a47d port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_d696_ins,
opc_div2_uxn_opcodes_h_l1061_c39_d696_k,
opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_27d3
result_MUX_uxn_opcodes_h_l1062_c7_27d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond,
result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_dcf7
opc_and_uxn_opcodes_h_l1062_c39_dcf7 : entity work.opc_and_0CLK_f3e79dfa port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins,
opc_and_uxn_opcodes_h_l1062_c39_dcf7_k,
opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_8290
result_MUX_uxn_opcodes_h_l1063_c7_8290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_8290_cond,
result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_a125
opc_and2_uxn_opcodes_h_l1063_c39_a125 : entity work.opc_and2_0CLK_3c565289 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_a125_ins,
opc_and2_uxn_opcodes_h_l1063_c39_a125_k,
opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_57c5
result_MUX_uxn_opcodes_h_l1064_c7_57c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond,
result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_f3c6
opc_ora_uxn_opcodes_h_l1064_c39_f3c6 : entity work.opc_ora_0CLK_f3e79dfa port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins,
opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k,
opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_903b
result_MUX_uxn_opcodes_h_l1065_c7_903b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_903b_cond,
result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_44e9
opc_ora2_uxn_opcodes_h_l1065_c39_44e9 : entity work.opc_ora2_0CLK_3c565289 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k,
opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_b989
result_MUX_uxn_opcodes_h_l1066_c7_b989 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_b989_cond,
result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_cdc6
opc_eor_uxn_opcodes_h_l1066_c39_cdc6 : entity work.opc_eor_0CLK_f3e79dfa port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins,
opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k,
opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_0a31
result_MUX_uxn_opcodes_h_l1067_c7_0a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond,
result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_8e88
opc_eor2_uxn_opcodes_h_l1067_c39_8e88 : entity work.opc_eor2_0CLK_3c565289 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k,
opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_2f42
result_MUX_uxn_opcodes_h_l1068_c7_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond,
result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_2c9f
opc_sft_uxn_opcodes_h_l1068_c39_2c9f : entity work.opc_sft_0CLK_9b9c5821 port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins,
opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k,
opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_c4bf
result_MUX_uxn_opcodes_h_l1069_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond,
result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_3300
opc_sft2_uxn_opcodes_h_l1069_c39_3300 : entity work.opc_sft2_0CLK_50c6a04c port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_3300_k,
opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_5138_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right := to_unsigned(252, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right := to_unsigned(33, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right := to_unsigned(253, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right := to_unsigned(18, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right := to_unsigned(35, 6);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right := to_unsigned(249, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right := to_unsigned(250, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right := to_unsigned(47, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right := to_unsigned(251, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right := to_unsigned(255, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right := to_unsigned(41, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right := to_unsigned(44, 6);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_74f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_5989] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_b362] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_22f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_88eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_f596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_c041] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_c805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_053c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_d560] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_037c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_5dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_3e6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_7f64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_0982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_14be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_41e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_f175] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_88d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_522d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_083b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_f361] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_c468] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_e1dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_b4a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_b644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_53d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_af45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_1682] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_54ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_14a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_06f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_370c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_0bcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_0d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_2a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_6fc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_5d93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_2dd2] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output := opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_20b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_293b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_6a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_608a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_cfae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_88ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_a9ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_771b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_be9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_b027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_3e92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_6876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_c81b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_15ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_68f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_9c4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_713c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_bed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_4140] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_73a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_850c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_b7d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_a62f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_acbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_0728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_bdca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_a7f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_7f55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_5be7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_4e15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_e812] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_7919] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_b4a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_0728_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_b644_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_0bcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_b362_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_c041_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_0d69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_608a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_037c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_e812_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_88eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_9c4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_68f5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f361_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_522d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2a71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_b7d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c81b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3e92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_850c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_a7f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_15ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_06f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_73a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_5989_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_713c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_293b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_c468_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_053c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_4e15_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_f175_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_370c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_d560_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_a62f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_acbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_3e6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_0982_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_c805_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cfae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_53d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_7919_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5d93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_083b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_88ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b027_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_771b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5dd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_7f64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_74f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1682_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_14be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_20b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6a29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_af45_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_be9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_41e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_54ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_6876_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_a9ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_e1dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_14a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_f596_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_6fc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4140_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_bed0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_88d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_7f55_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bdca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_5be7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_2dd2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_2228] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_2228_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_1d6e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_38cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_1d6e_return_output;
     -- opc_jci[uxn_opcodes_h_l1001_c39_955e] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output := opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_67cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_3fd5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3fd5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_955e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_5911] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_7bee] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3729] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5911_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3729_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_7bee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_62cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_6942] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_4619] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_4619_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_6942_return_output;
     -- opc_lit[uxn_opcodes_h_l1004_c39_5ad0] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output := opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_b99d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_3987] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_3987_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_b99d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_5ad0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_dd6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_b5d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_e845] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_dd6c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_e845_return_output;
     -- opc_litr[uxn_opcodes_h_l1006_c39_f426] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_f426_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output := opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_2746] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_13c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_2746_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_f426_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_a502] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_9cf3] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_aee0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_a502_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_9cf3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_19d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_60dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_7a91] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_7a91_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output := opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_60dc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_7a91_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_305f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_58e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_b86e] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_305f_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_58e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b86e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_b002] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_3529] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_f81f] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_f81f_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output := opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_3529_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_b002_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_f81f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_0f2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_a6c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output;

     -- opc_pop2[uxn_opcodes_h_l1011_c39_1057] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_1057_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_0f2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_1057_return_output;
     -- opc_nip[uxn_opcodes_h_l1012_c39_7d4a] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output := opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_b797] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_fd10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_b797_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_7d4a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_5e14] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output;

     -- opc_nip2[uxn_opcodes_h_l1013_c39_03a9] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_ee10] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_ee10_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_03a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_944a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_4fe5] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output := opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_f5db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_944a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_4fe5_return_output;
     -- opc_swp2[uxn_opcodes_h_l1015_c39_d151] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_d151_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_fc57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_46c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_fc57_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_d151_return_output;
     -- opc_rot[uxn_opcodes_h_l1016_c39_e0bf] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output := opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_c9a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_3022] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_3022_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_e0bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_220a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_789c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_75c8] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_220a_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_789c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_75c8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_499c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output;

     -- opc_dup[uxn_opcodes_h_l1018_c39_4cd3] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output := opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_c0bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_499c_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_c0bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_4cd3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_7e28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_8123] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_de08] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_de08_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_8123_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_7e28_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_de08_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_adfb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_8746] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_4324] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_4324_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_8746_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_4324_return_output;
     -- opc_ovr2[uxn_opcodes_h_l1021_c39_bb56] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_586b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_d1e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_586b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_bb56_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_2a8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_ea4f] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output := opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_bed2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_2a8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_ea4f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_aa56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_6dac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output;

     -- opc_equ2[uxn_opcodes_h_l1023_c39_def2] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_def2_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_aa56_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_def2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_d311] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_2a92] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_a755] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_a755_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_a755_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output := opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d311_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_2a92_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_a755_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_143c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_ec1e] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4d98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_143c_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4d98_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_ec1e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_cfd4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_a279] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output;

     -- opc_gth[uxn_opcodes_h_l1026_c39_f90e] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_f90e_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output := opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_a279_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_f90e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_661b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_9980] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output;

     -- opc_gth2[uxn_opcodes_h_l1027_c39_63c0] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_661b_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_9980_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_63c0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_6994] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_407a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_8cb2] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output := opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6994_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_407a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_8cb2_return_output;
     -- opc_lth2[uxn_opcodes_h_l1029_c39_493a] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_493a_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_1476] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d468] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d468_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_1476_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_493a_return_output;
     -- opc_jmp[uxn_opcodes_h_l1030_c39_0e05] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_7b9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_487e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_487e_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7b9e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_0e05_return_output;
     -- opc_jmp2[uxn_opcodes_h_l1031_c39_c65b] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_61a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_2c4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2c4b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_c65b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_1697] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_5991] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_5641] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_5641_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_1697_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5991_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_5641_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_7d9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_cd69] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_447c] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_cd69_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_447c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d55d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_c2de] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_3476] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_3476_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_c2de_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_1afd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_b442] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_79de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_79de_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_b442_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_c658] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_fe56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_24ef] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_24ef_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output := opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c658_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_fe56_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_24ef_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_6c4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output;

     -- opc_sth2[uxn_opcodes_h_l1037_c39_f57f] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_f1fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_f1fa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f57f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_fec7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_e6e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output;

     -- opc_ldz[uxn_opcodes_h_l1038_c39_5c7c] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_fec7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_5c7c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_933a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_8ee5] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_9ecc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_933a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_8ee5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_402a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_8403] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_9d85] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_9d85_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output := opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_402a_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_8403_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_9d85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_940c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_7238] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_18a2] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_7238_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_940c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_18a2_return_output;
     -- opc_ldr[uxn_opcodes_h_l1042_c39_0a24] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_bff1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_cf75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_bff1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_0a24_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_64ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_b25c] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_f4e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_f4e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_b25c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_4d56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_c4f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_1bf3] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_ins;
     opc_str_uxn_opcodes_h_l1044_c39_1bf3_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output := opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_c4f1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_1bf3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_8055] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_1ca9] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output := opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_eccc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_8055_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_1ca9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_1e0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_24d9] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_24d9_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output := opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_2b7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_1e0e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_24d9_return_output;
     -- opc_lda2[uxn_opcodes_h_l1047_c39_6853] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_6853_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_6ef7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_73fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_73fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_6853_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_f298] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_a0b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_f964] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_f964_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_f964_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output := opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_f298_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_a0b6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_f964_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_fdc7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_bf9d] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_0bca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_0bca_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_bf9d_return_output;
     -- opc_dei[uxn_opcodes_h_l1050_c39_a1d1] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output := opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_9d13] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_5d5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_9d13_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_a1d1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_2717] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_5119] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_5119_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_10f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_2717_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_10f1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_5119_return_output;
     -- opc_deo[uxn_opcodes_h_l1052_c39_caa5] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_caa5_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output := opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_a0b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_375c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_375c_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_a0b6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_caa5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_ca30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_2efc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_8a68] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_2efc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_8a68_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_da52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_3694] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_8aeb] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_ins;
     opc_add_uxn_opcodes_h_l1054_c39_8aeb_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output := opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_3694_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_da52_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_8aeb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_7c08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_5e7a] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output := opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_b51d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_7c08_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_5e7a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_426d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_5cf0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_8963] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_8963_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_8963_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output := opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_426d_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5cf0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_8963_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_f42c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output;

     -- opc_sub2[uxn_opcodes_h_l1057_c39_a505] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_a505_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_c192] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c192_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_f42c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_a505_return_output;
     -- opc_mul[uxn_opcodes_h_l1058_c39_8792] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_8792_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_8792_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output := opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_7ba0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_cf26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_7ba0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_8792_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_7173] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_02fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_6862] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_6862_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7173_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_02fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_6862_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_9f1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_27d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_5138] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_5138_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_ins;
     opc_div_uxn_opcodes_h_l1060_c39_5138_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_return_output := opc_div_uxn_opcodes_h_l1060_c39_5138_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_9f1b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_5138_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_8290] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_9b99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_d696] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_d696_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_d696_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output := opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_8290_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9b99_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_d696_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_eae3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_dcf7] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_ins;
     opc_and_uxn_opcodes_h_l1062_c39_dcf7_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output := opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_57c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_eae3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_dcf7_return_output;
     -- opc_and2[uxn_opcodes_h_l1063_c39_a125] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_a125_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_a125_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output := opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_6c68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_903b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_903b_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_6c68_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_a125_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_b989] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_f3c6] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output := opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_02c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_b989_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_02c3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_f3c6_return_output;
     -- opc_ora2[uxn_opcodes_h_l1065_c39_44e9] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_0b38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_0a31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_0b38_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_44e9_return_output;
     -- opc_eor[uxn_opcodes_h_l1066_c39_cdc6] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output := opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_2f42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_5a48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_5a48_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_cdc6_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_8e88] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_c4bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_0c5b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_0c5b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_8e88_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_092b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output;

     -- opc_sft[uxn_opcodes_h_l1068_c39_2c9f] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output := opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_092b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_2c9f_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_3300] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_3300_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_3300_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_c4bf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output := result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_c4bf_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_2f42] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output := result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_2f42_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_0a31] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output := result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_0a31_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_b989] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_b989_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output := result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_b989_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_903b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_903b_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output := result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_903b_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_57c5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output := result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_57c5_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_8290] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_8290_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output := result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_8290_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_27d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output := result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_27d3_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_7173] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_7173_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output := result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_7173_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_cf26] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output := result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_cf26_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_c192] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_c192_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output := result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_c192_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_426d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_426d_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output := result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_426d_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_b51d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output := result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_b51d_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_3694] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_3694_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output := result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_3694_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_ca30] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output := result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_ca30_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_375c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_375c_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output := result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_375c_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_2717] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_2717_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output := result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_2717_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_5d5d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output := result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_5d5d_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_fdc7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output := result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_fdc7_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_f298] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_f298_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output := result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_f298_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_6ef7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output := result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_6ef7_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_2b7f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output := result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_2b7f_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_eccc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output := result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_eccc_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_4d56] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output := result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_4d56_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_64ff] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output := result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_64ff_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_cf75] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output := result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_cf75_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_7238] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_7238_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output := result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_7238_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_402a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_402a_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output := result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_402a_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_9ecc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output := result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_9ecc_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_e6e1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output := result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_e6e1_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_6c4c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output := result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_6c4c_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_c658] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_c658_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output := result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_c658_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_1afd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output := result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_1afd_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_d55d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output := result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_d55d_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_7d9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output := result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_7d9a_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_1697] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_1697_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output := result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_1697_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_61a0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output := result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_61a0_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_487e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_487e_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output := result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_487e_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_d468] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_d468_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output := result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_d468_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_6994] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_6994_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output := result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_6994_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_661b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_661b_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output := result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_661b_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_cfd4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output := result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_cfd4_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_143c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_143c_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output := result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_143c_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_d311] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_d311_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output := result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_d311_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_6dac] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output := result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_6dac_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_bed2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output := result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_bed2_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_d1e3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output := result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_d1e3_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_adfb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output := result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_adfb_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_8123] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_8123_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output := result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_8123_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_499c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_499c_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output := result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_499c_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_220a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_220a_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output := result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_220a_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_c9a0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output := result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_c9a0_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_46c8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output := result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_46c8_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_f5db] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output := result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_f5db_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_5e14] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output := result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_5e14_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_fd10] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output := result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_fd10_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_a6c0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output := result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_a6c0_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_3529] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_3529_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output := result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_3529_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_305f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_305f_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output := result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_305f_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_19d6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output := result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_19d6_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_aee0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output := result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_aee0_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_13c5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output := result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_13c5_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_b5d4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output := result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_b5d4_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_3987] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_3987_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output := result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_3987_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_62cf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output := result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_62cf_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_5911] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_5911_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output := result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_5911_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_67cc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output := result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_67cc_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_38cb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output := result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_38cb_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_2228] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_2228_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output := result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_2228_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_5e83] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output := result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_5e83_return_output;
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
