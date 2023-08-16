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
entity eval_opcode_0CLK_c5f1fcde is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_c5f1fcde;
architecture arch of eval_opcode_0CLK_c5f1fcde is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_ae76]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_a586]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_ee2f]
signal result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_d0fd]
signal opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_1a48]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_db78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_de41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_a586]
signal result_MUX_uxn_opcodes_h_l1001_c7_a586_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_a6cb]
signal opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_425a]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_bc73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_cb48]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_de41]
signal result_MUX_uxn_opcodes_h_l1002_c7_de41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_8938]
signal opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_b539]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_b610]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_d63b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_cb48]
signal result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_972c]
signal opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_221a]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_254d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_87b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_d63b]
signal result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_6ad4]
signal opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_8f8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_4cdc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_6ec8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_87b3]
signal result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_30af]
signal opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_235b]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_3aea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_3c6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_6ec8]
signal result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_840a]
signal opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_840a_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_b21f]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_c2fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_673c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_3c6c]
signal result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_dc14]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_4c2c]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_7d6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_e59a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_673c]
signal result_MUX_uxn_opcodes_h_l1008_c7_673c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_048c]
signal opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_048c_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_048c_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_7034]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_8689]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_3fd3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_e59a]
signal result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_8aa7]
signal opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_6814]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_eda8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_233c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_3fd3]
signal result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_4353]
signal opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4353_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4353_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_310e]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_5405]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_12cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_233c]
signal result_MUX_uxn_opcodes_h_l1011_c7_233c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_053c]
signal opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_053c_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_c43c]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_69d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_7522]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_12cc]
signal result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_4df4]
signal opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4df4_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_731d]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_8a15]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_da5c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_7522]
signal result_MUX_uxn_opcodes_h_l1013_c7_7522_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_9f52]
signal opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_3d53]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_9761]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_8d25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_da5c]
signal result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_94f5]
signal opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_94f5_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_5ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_be9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_5d87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_8d25]
signal result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_f9f8]
signal opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_978e]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_701c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_c5ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_5d87]
signal result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_0376]
signal opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_0376_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_0376_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_c3e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_382d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_073e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_c5ce]
signal result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_6c5e]
signal opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_1c34]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_e0da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_8f53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_073e]
signal result_MUX_uxn_opcodes_h_l1018_c7_073e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_ae77]
signal opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ae77_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_3440]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_525e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_409d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_8f53]
signal result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_57ca]
signal opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_c218]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_d6fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_7741]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_409d]
signal result_MUX_uxn_opcodes_h_l1020_c7_409d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_3756]
signal opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_3756_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_4d7b]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_3704]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_74b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_7741]
signal result_MUX_uxn_opcodes_h_l1021_c7_7741_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_5876]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_32c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_b7bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_c38b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_74b6]
signal result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_e9b2]
signal opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_2ce2]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_4edf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_b9b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_c38b]
signal result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_d625]
signal opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_d625_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_abaa]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_0dc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_13f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_b9b8]
signal result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_980e]
signal opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_980e_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_980e_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_f4c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_e5fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_36ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_13f7]
signal result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_4759]
signal opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_4759_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_75d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_8454]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_b74e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_36ad]
signal result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_2026]
signal opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_2026_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_2026_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_1c73]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_5904]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_3ae1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_b74e]
signal result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_b007]
signal opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_b007_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_ae0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_b9ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9895]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_3ae1]
signal result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_d91a]
signal opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_d91a_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_820a]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_1455]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_e998]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_9895]
signal result_MUX_uxn_opcodes_h_l1029_c7_9895_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_e637]
signal opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_e637_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_8627]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_c078]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_9b33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_e998]
signal result_MUX_uxn_opcodes_h_l1030_c7_e998_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_a8a1]
signal opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_7665]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_356d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_0db2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_9b33]
signal result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_3ebb]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_4561]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_befa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_c100]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_0db2]
signal result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_4e92]
signal opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_1ce2]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_6e2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_34d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_c100]
signal result_MUX_uxn_opcodes_h_l1033_c7_c100_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_a0e0]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_163e]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_687d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_f29e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_34d6]
signal result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_96d2]
signal opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_8655]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_0442]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_b0c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_f29e]
signal result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_7d7b]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_5c7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_7e0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_58e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_b0c8]
signal result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_2612]
signal opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_2612_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_2612_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_3c28]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_ea22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_0a09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_58e3]
signal result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_03da]
signal opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_03da_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_1453]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_ea8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_f7e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_0a09]
signal result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_f8a6]
signal opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_cd28]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_19e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_44c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_f7e6]
signal result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_ed77]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_edea]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_fd7d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_e58a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_44c2]
signal result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_5c48]
signal opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_5c48_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_e747]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_94d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_7ac1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_e58a]
signal result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_5652]
signal opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_5652_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_ba1f]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_e826]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_0851]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_7ac1]
signal result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_c14f]
signal opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6177]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_7f47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_f0c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_0851]
signal result_MUX_uxn_opcodes_h_l1043_c7_0851_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_eea8]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_ce77]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_092d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_3f0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_f0c0]
signal result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_6ea7]
signal opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_6ea7_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_c074]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_eb64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_0298]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_3f0b]
signal result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_a992]
signal opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_a992_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_a992_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_2263]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_239e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_c1a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_0298]
signal result_MUX_uxn_opcodes_h_l1046_c7_0298_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_17a8]
signal opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_17a8_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_b551]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_a781]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_2f84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_c1a1]
signal result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_b95c]
signal opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_b3e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_2d1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_f1bd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_2f84]
signal result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_44b5]
signal opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_44b5_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_c0e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_de4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_96db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_f1bd]
signal result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_0db6]
signal opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_4897]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_ea6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_d569]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_96db]
signal result_MUX_uxn_opcodes_h_l1050_c7_96db_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_611b]
signal opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_611b_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_611b_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_6a29]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_e835]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_7147]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_d569]
signal result_MUX_uxn_opcodes_h_l1051_c7_d569_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_fd54]
signal opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_0457]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_72b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_b00b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_7147]
signal result_MUX_uxn_opcodes_h_l1052_c7_7147_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_cd09]
signal opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_cd09_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_a167]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_fa5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_49fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_b00b]
signal result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_ad8e]
signal opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_0ea4]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_7670]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_7224]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_49fb]
signal result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_0c86]
signal opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_0c86_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_0c86_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_1e9a]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_0754]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_5194]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_7224]
signal result_MUX_uxn_opcodes_h_l1055_c7_7224_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_5321]
signal opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5321_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5321_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_2788]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_94b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_a254]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_5194]
signal result_MUX_uxn_opcodes_h_l1056_c7_5194_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_620d]
signal opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_620d_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_620d_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_6cbe]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_5a45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_93e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_a254]
signal result_MUX_uxn_opcodes_h_l1057_c7_a254_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_0c2e]
signal opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_4b78]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_3821]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_8f8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_93e1]
signal result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_8d6d]
signal opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_10e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_1be9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_e40a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_8f8a]
signal result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_2d9f]
signal opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_488e]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_93e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_e591]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_e40a]
signal result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_0687]
signal opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0687_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0687_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_0687_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_d204]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_fec6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_8b0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_e591]
signal result_MUX_uxn_opcodes_h_l1061_c7_e591_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_39a0]
signal opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_39a0_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_eb29]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_9bd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_7ecb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_8b0d]
signal result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_1680]
signal opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1680_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1680_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1680_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_4b75]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_df2a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_e729]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_7ecb]
signal result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_bc5d]
signal opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_1cae]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_a461]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_e13d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_e729]
signal result_MUX_uxn_opcodes_h_l1064_c7_e729_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_f680]
signal opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f680_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f680_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_5090]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_d8d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_a767]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_e13d]
signal result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_e651]
signal opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_e651_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_ab4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_7091]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_f483]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_a767]
signal result_MUX_uxn_opcodes_h_l1066_c7_a767_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_4a91]
signal opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_4a91_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ed31]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_14e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_7cf1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_f483]
signal result_MUX_uxn_opcodes_h_l1067_c7_f483_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_843d]
signal opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_843d_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_bfd7]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_cfe5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_394c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_7cf1]
signal result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_ca30]
signal opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ca30_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_fd68]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_b081]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_394c]
signal result_MUX_uxn_opcodes_h_l1069_c7_394c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_603b]
signal opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_603b_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_ee2f
result_MUX_uxn_opcodes_h_l1000_c2_ee2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond,
result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_d0fd
opc_brk_uxn_opcodes_h_l1000_c34_d0fd : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_a586
result_MUX_uxn_opcodes_h_l1001_c7_a586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_a586_cond,
result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_a6cb
opc_jci_uxn_opcodes_h_l1001_c39_a6cb : entity work.opc_jci_0CLK_1cb70a16 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_de41
result_MUX_uxn_opcodes_h_l1002_c7_de41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_de41_cond,
result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_8938
opc_jmi_uxn_opcodes_h_l1002_c39_8938 : entity work.opc_jmi_0CLK_8329ae76 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_cb48
result_MUX_uxn_opcodes_h_l1003_c7_cb48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond,
result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_972c
opc_jsi_uxn_opcodes_h_l1003_c39_972c : entity work.opc_jsi_0CLK_f688c1b6 port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_d63b
result_MUX_uxn_opcodes_h_l1004_c7_d63b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond,
result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_6ad4
opc_lit_uxn_opcodes_h_l1004_c39_6ad4 : entity work.opc_lit_0CLK_c9a1c2ba port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins,
opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_87b3
result_MUX_uxn_opcodes_h_l1005_c7_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond,
result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_30af
opc_lit2_uxn_opcodes_h_l1005_c39_30af : entity work.opc_lit2_0CLK_ae709f35 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_6ec8
result_MUX_uxn_opcodes_h_l1006_c7_6ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond,
result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_840a
opc_litr_uxn_opcodes_h_l1006_c39_840a : entity work.opc_litr_0CLK_c9a1c2ba port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_840a_ins,
opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_3c6c
result_MUX_uxn_opcodes_h_l1007_c7_3c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond,
result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_dc14
opc_lit2r_uxn_opcodes_h_l1007_c39_dc14 : entity work.opc_lit2r_0CLK_ae709f35 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_673c
result_MUX_uxn_opcodes_h_l1008_c7_673c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_673c_cond,
result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_048c
opc_inc_uxn_opcodes_h_l1008_c39_048c : entity work.opc_inc_0CLK_0c7a52a4 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_048c_ins,
opc_inc_uxn_opcodes_h_l1008_c39_048c_k,
opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_e59a
result_MUX_uxn_opcodes_h_l1009_c7_e59a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond,
result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_8aa7
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7 : entity work.opc_inc2_0CLK_1ab9fb03 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k,
opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_3fd3
result_MUX_uxn_opcodes_h_l1010_c7_3fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond,
result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_4353
opc_pop_uxn_opcodes_h_l1010_c39_4353 : entity work.opc_pop_0CLK_4048d9e1 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_4353_ins,
opc_pop_uxn_opcodes_h_l1010_c39_4353_k,
opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_233c
result_MUX_uxn_opcodes_h_l1011_c7_233c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_233c_cond,
result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_053c
opc_pop2_uxn_opcodes_h_l1011_c39_053c : entity work.opc_pop2_0CLK_4048d9e1 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_053c_k,
opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_12cc
result_MUX_uxn_opcodes_h_l1012_c7_12cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond,
result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_4df4
opc_nip_uxn_opcodes_h_l1012_c39_4df4 : entity work.opc_nip_0CLK_f9c67b24 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins,
opc_nip_uxn_opcodes_h_l1012_c39_4df4_k,
opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_7522
result_MUX_uxn_opcodes_h_l1013_c7_7522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_7522_cond,
result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_9f52
opc_nip2_uxn_opcodes_h_l1013_c39_9f52 : entity work.opc_nip2_0CLK_079dd2f7 port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k,
opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_da5c
result_MUX_uxn_opcodes_h_l1014_c7_da5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond,
result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_94f5
opc_swp_uxn_opcodes_h_l1014_c39_94f5 : entity work.opc_swp_0CLK_410796d1 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins,
opc_swp_uxn_opcodes_h_l1014_c39_94f5_k,
opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_8d25
result_MUX_uxn_opcodes_h_l1015_c7_8d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond,
result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_f9f8
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8 : entity work.opc_swp2_0CLK_e5bf91c7 port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k,
opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_5d87
result_MUX_uxn_opcodes_h_l1016_c7_5d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond,
result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_0376
opc_rot_uxn_opcodes_h_l1016_c39_0376 : entity work.opc_rot_0CLK_2a66690c port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_0376_ins,
opc_rot_uxn_opcodes_h_l1016_c39_0376_k,
opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_c5ce
result_MUX_uxn_opcodes_h_l1017_c7_c5ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond,
result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_6c5e
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e : entity work.opc_rot2_0CLK_37f631b8 port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k,
opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_073e
result_MUX_uxn_opcodes_h_l1018_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_073e_cond,
result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_ae77
opc_dup_uxn_opcodes_h_l1018_c39_ae77 : entity work.opc_dup_0CLK_9b5d56e3 port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins,
opc_dup_uxn_opcodes_h_l1018_c39_ae77_k,
opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_8f53
result_MUX_uxn_opcodes_h_l1019_c7_8f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond,
result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_57ca
opc_dup2_uxn_opcodes_h_l1019_c39_57ca : entity work.opc_dup2_0CLK_72796641 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k,
opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_409d
result_MUX_uxn_opcodes_h_l1020_c7_409d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_409d_cond,
result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_3756
opc_ovr_uxn_opcodes_h_l1020_c39_3756 : entity work.opc_ovr_0CLK_c88ac701 port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_3756_k,
opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_7741
result_MUX_uxn_opcodes_h_l1021_c7_7741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_7741_cond,
result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_5876
opc_ovr2_uxn_opcodes_h_l1021_c39_5876 : entity work.opc_ovr2_0CLK_fe67c4cf port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_74b6
result_MUX_uxn_opcodes_h_l1022_c7_74b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond,
result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_e9b2
opc_equ_uxn_opcodes_h_l1022_c39_e9b2 : entity work.opc_equ_0CLK_3e151c71 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins,
opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k,
opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_c38b
result_MUX_uxn_opcodes_h_l1023_c7_c38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond,
result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_d625
opc_equ2_uxn_opcodes_h_l1023_c39_d625 : entity work.opc_equ2_0CLK_03791a9b port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_d625_k,
opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_b9b8
result_MUX_uxn_opcodes_h_l1024_c7_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond,
result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_980e
opc_neq_uxn_opcodes_h_l1024_c39_980e : entity work.opc_neq_0CLK_3e151c71 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_980e_ins,
opc_neq_uxn_opcodes_h_l1024_c39_980e_k,
opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_13f7
result_MUX_uxn_opcodes_h_l1025_c7_13f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond,
result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_4759
opc_neq2_uxn_opcodes_h_l1025_c39_4759 : entity work.opc_neq2_0CLK_03791a9b port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_4759_k,
opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_36ad
result_MUX_uxn_opcodes_h_l1026_c7_36ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond,
result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_2026
opc_gth_uxn_opcodes_h_l1026_c39_2026 : entity work.opc_gth_0CLK_3e151c71 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_2026_ins,
opc_gth_uxn_opcodes_h_l1026_c39_2026_k,
opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_b74e
result_MUX_uxn_opcodes_h_l1027_c7_b74e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond,
result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_b007
opc_gth2_uxn_opcodes_h_l1027_c39_b007 : entity work.opc_gth2_0CLK_03791a9b port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_b007_k,
opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_3ae1
result_MUX_uxn_opcodes_h_l1028_c7_3ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond,
result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_d91a
opc_lth_uxn_opcodes_h_l1028_c39_d91a : entity work.opc_lth_0CLK_3e151c71 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins,
opc_lth_uxn_opcodes_h_l1028_c39_d91a_k,
opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_9895
result_MUX_uxn_opcodes_h_l1029_c7_9895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_9895_cond,
result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_e637
opc_lth2_uxn_opcodes_h_l1029_c39_e637 : entity work.opc_lth2_0CLK_03791a9b port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_e637_k,
opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_e998
result_MUX_uxn_opcodes_h_l1030_c7_e998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_e998_cond,
result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_a8a1
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1 : entity work.opc_jmp_0CLK_e9604d53 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k,
opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_9b33
result_MUX_uxn_opcodes_h_l1031_c7_9b33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond,
result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb : entity work.opc_jmp2_0CLK_24220520 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_0db2
result_MUX_uxn_opcodes_h_l1032_c7_0db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond,
result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_4e92
opc_jcn_uxn_opcodes_h_l1032_c39_4e92 : entity work.opc_jcn_0CLK_3426fa3b port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k,
opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_c100
result_MUX_uxn_opcodes_h_l1033_c7_c100 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_c100_cond,
result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0 : entity work.opc_jcn2_0CLK_780062b1 port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_34d6
result_MUX_uxn_opcodes_h_l1034_c7_34d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond,
result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_96d2
opc_jsr_uxn_opcodes_h_l1034_c39_96d2 : entity work.opc_jsr_0CLK_db4e4c59 port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k,
opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_f29e
result_MUX_uxn_opcodes_h_l1035_c7_f29e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond,
result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b : entity work.opc_jsr2_0CLK_2f531d50 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_b0c8
result_MUX_uxn_opcodes_h_l1036_c7_b0c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond,
result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_2612
opc_sth_uxn_opcodes_h_l1036_c39_2612 : entity work.opc_sth_0CLK_a86d3921 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_2612_ins,
opc_sth_uxn_opcodes_h_l1036_c39_2612_k,
opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_58e3
result_MUX_uxn_opcodes_h_l1037_c7_58e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond,
result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_03da
opc_sth2_uxn_opcodes_h_l1037_c39_03da : entity work.opc_sth2_0CLK_dfc28e7b port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_03da_k,
opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_0a09
result_MUX_uxn_opcodes_h_l1038_c7_0a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond,
result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_f8a6
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6 : entity work.opc_ldz_0CLK_4e2a823a port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k,
opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_f7e6
result_MUX_uxn_opcodes_h_l1039_c7_f7e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond,
result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_ed77
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77 : entity work.opc_ldz2_0CLK_c9c328be port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_44c2
result_MUX_uxn_opcodes_h_l1040_c7_44c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond,
result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_5c48
opc_stz_uxn_opcodes_h_l1040_c39_5c48 : entity work.opc_stz_0CLK_f0550f9f port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins,
opc_stz_uxn_opcodes_h_l1040_c39_5c48_k,
opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_e58a
result_MUX_uxn_opcodes_h_l1041_c7_e58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond,
result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_5652
opc_stz2_uxn_opcodes_h_l1041_c39_5652 : entity work.opc_stz2_0CLK_546e77c3 port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_5652_k,
opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_7ac1
result_MUX_uxn_opcodes_h_l1042_c7_7ac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond,
result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_c14f
opc_ldr_uxn_opcodes_h_l1042_c39_c14f : entity work.opc_ldr_0CLK_db53c64f port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k,
opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_0851
result_MUX_uxn_opcodes_h_l1043_c7_0851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_0851_cond,
result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_eea8
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8 : entity work.opc_ldr2_0CLK_df09aa92 port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_f0c0
result_MUX_uxn_opcodes_h_l1044_c7_f0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond,
result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_6ea7
opc_str_uxn_opcodes_h_l1044_c39_6ea7 : entity work.opc_str_0CLK_7389dbc4 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins,
opc_str_uxn_opcodes_h_l1044_c39_6ea7_k,
opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_3f0b
result_MUX_uxn_opcodes_h_l1045_c7_3f0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond,
result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_a992
opc_str2_uxn_opcodes_h_l1045_c39_a992 : entity work.opc_str2_0CLK_bcf91129 port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_a992_ins,
opc_str2_uxn_opcodes_h_l1045_c39_a992_k,
opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_0298
result_MUX_uxn_opcodes_h_l1046_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_0298_cond,
result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_17a8
opc_lda_uxn_opcodes_h_l1046_c39_17a8 : entity work.opc_lda_0CLK_537eb046 port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins,
opc_lda_uxn_opcodes_h_l1046_c39_17a8_k,
opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_c1a1
result_MUX_uxn_opcodes_h_l1047_c7_c1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond,
result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_b95c
opc_lda2_uxn_opcodes_h_l1047_c39_b95c : entity work.opc_lda2_0CLK_537eb046 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k,
opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_2f84
result_MUX_uxn_opcodes_h_l1048_c7_2f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond,
result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_44b5
opc_sta_uxn_opcodes_h_l1048_c39_44b5 : entity work.opc_sta_0CLK_7806c46b port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins,
opc_sta_uxn_opcodes_h_l1048_c39_44b5_k,
opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_f1bd
result_MUX_uxn_opcodes_h_l1049_c7_f1bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond,
result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_0db6
opc_sta2_uxn_opcodes_h_l1049_c39_0db6 : entity work.opc_sta2_0CLK_6107d9be port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k,
opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_96db
result_MUX_uxn_opcodes_h_l1050_c7_96db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_96db_cond,
result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_611b
opc_dei_uxn_opcodes_h_l1050_c39_611b : entity work.opc_dei_0CLK_1dc85f13 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_611b_ins,
opc_dei_uxn_opcodes_h_l1050_c39_611b_k,
opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_d569
result_MUX_uxn_opcodes_h_l1051_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_d569_cond,
result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_fd54
opc_dei2_uxn_opcodes_h_l1051_c39_fd54 : entity work.opc_dei2_0CLK_bbf9b196 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k,
opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_7147
result_MUX_uxn_opcodes_h_l1052_c7_7147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_7147_cond,
result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_cd09
opc_deo_uxn_opcodes_h_l1052_c39_cd09 : entity work.opc_deo_0CLK_6492501c port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins,
opc_deo_uxn_opcodes_h_l1052_c39_cd09_k,
opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_b00b
result_MUX_uxn_opcodes_h_l1053_c7_b00b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond,
result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_ad8e
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e : entity work.opc_deo2_0CLK_3f01db15 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k,
opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_49fb
result_MUX_uxn_opcodes_h_l1054_c7_49fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond,
result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_0c86
opc_add_uxn_opcodes_h_l1054_c39_0c86 : entity work.opc_add_0CLK_01981c66 port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_0c86_ins,
opc_add_uxn_opcodes_h_l1054_c39_0c86_k,
opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_7224
result_MUX_uxn_opcodes_h_l1055_c7_7224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_7224_cond,
result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_5321
opc_add2_uxn_opcodes_h_l1055_c39_5321 : entity work.opc_add2_0CLK_3a773714 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_5321_ins,
opc_add2_uxn_opcodes_h_l1055_c39_5321_k,
opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_5194
result_MUX_uxn_opcodes_h_l1056_c7_5194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_5194_cond,
result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_620d
opc_sub_uxn_opcodes_h_l1056_c39_620d : entity work.opc_sub_0CLK_01981c66 port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_620d_ins,
opc_sub_uxn_opcodes_h_l1056_c39_620d_k,
opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_a254
result_MUX_uxn_opcodes_h_l1057_c7_a254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_a254_cond,
result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_0c2e
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e : entity work.opc_sub2_0CLK_3a773714 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k,
opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_93e1
result_MUX_uxn_opcodes_h_l1058_c7_93e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond,
result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_8d6d
opc_mul_uxn_opcodes_h_l1058_c39_8d6d : entity work.opc_mul_0CLK_01981c66 port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins,
opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k,
opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_8f8a
result_MUX_uxn_opcodes_h_l1059_c7_8f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond,
result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_2d9f
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f : entity work.opc_mul2_0CLK_3a773714 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k,
opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_e40a
result_MUX_uxn_opcodes_h_l1060_c7_e40a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond,
result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_0687
opc_div_uxn_opcodes_h_l1060_c39_0687 : entity work.opc_div_0CLK_62543186 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_0687_ins,
opc_div_uxn_opcodes_h_l1060_c39_0687_k,
opc_div_uxn_opcodes_h_l1060_c39_0687_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_e591
result_MUX_uxn_opcodes_h_l1061_c7_e591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_e591_cond,
result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_39a0
opc_div2_uxn_opcodes_h_l1061_c39_39a0 : entity work.opc_div2_0CLK_3faa8efd port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins,
opc_div2_uxn_opcodes_h_l1061_c39_39a0_k,
opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_8b0d
result_MUX_uxn_opcodes_h_l1062_c7_8b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond,
result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_1680
opc_and_uxn_opcodes_h_l1062_c39_1680 : entity work.opc_and_0CLK_01981c66 port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_1680_ins,
opc_and_uxn_opcodes_h_l1062_c39_1680_k,
opc_and_uxn_opcodes_h_l1062_c39_1680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_7ecb
result_MUX_uxn_opcodes_h_l1063_c7_7ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond,
result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_bc5d
opc_and2_uxn_opcodes_h_l1063_c39_bc5d : entity work.opc_and2_0CLK_3a773714 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins,
opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k,
opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_e729
result_MUX_uxn_opcodes_h_l1064_c7_e729 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_e729_cond,
result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_f680
opc_ora_uxn_opcodes_h_l1064_c39_f680 : entity work.opc_ora_0CLK_01981c66 port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_f680_ins,
opc_ora_uxn_opcodes_h_l1064_c39_f680_k,
opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_e13d
result_MUX_uxn_opcodes_h_l1065_c7_e13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond,
result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_e651
opc_ora2_uxn_opcodes_h_l1065_c39_e651 : entity work.opc_ora2_0CLK_3a773714 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_e651_k,
opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_a767
result_MUX_uxn_opcodes_h_l1066_c7_a767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_a767_cond,
result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_4a91
opc_eor_uxn_opcodes_h_l1066_c39_4a91 : entity work.opc_eor_0CLK_01981c66 port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins,
opc_eor_uxn_opcodes_h_l1066_c39_4a91_k,
opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_f483
result_MUX_uxn_opcodes_h_l1067_c7_f483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_f483_cond,
result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_843d
opc_eor2_uxn_opcodes_h_l1067_c39_843d : entity work.opc_eor2_0CLK_3a773714 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_843d_k,
opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_7cf1
result_MUX_uxn_opcodes_h_l1068_c7_7cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond,
result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_ca30
opc_sft_uxn_opcodes_h_l1068_c39_ca30 : entity work.opc_sft_0CLK_b5dadc14 port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins,
opc_sft_uxn_opcodes_h_l1068_c39_ca30_k,
opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_394c
result_MUX_uxn_opcodes_h_l1069_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_394c_cond,
result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_603b
opc_sft2_uxn_opcodes_h_l1069_c39_603b : entity work.opc_sft2_0CLK_9b5616d0 port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_603b_k,
opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_0687_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_1680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right := to_unsigned(255, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right := to_unsigned(252, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right := to_unsigned(30, 5);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right := to_unsigned(254, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right := to_unsigned(41, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right := to_unsigned(250, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right := to_unsigned(251, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right := to_unsigned(22, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right := to_unsigned(249, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right := to_unsigned(24, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_c43c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_1cae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_d204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_163e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_32c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_75d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_1ce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_10e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_5ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_5090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_1c34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_4897] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_d0fd] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output := opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ed31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_235b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_ba1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_3d53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_a167] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_ab4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_3c28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_e747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_6a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_6814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_978e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_4b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_2ce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_0ea4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_1a48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_310e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_c3e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_731d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_ae0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_425a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_b551] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6177] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_1c73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_3440] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_7034] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_7665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_5c7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_2263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_fd68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_8627] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_ce77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_4561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_ae76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_c0e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_1453] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_abaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_edea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_bfd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_c074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_221a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_b21f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_0457] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_cd28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_c218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_820a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_4d7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_4b78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_6cbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_2788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_b539] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_eb29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_488e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_8f8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_8655] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_b3e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_1e9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_f4c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_4c2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ae76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1a48_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_425a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b539_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_221a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8f8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_235b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_b21f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_4c2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_7034_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_6814_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_310e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_c43c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_731d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_3d53_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_5ca3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_978e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_c3e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_1c34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_3440_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_c218_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_4d7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_32c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_2ce2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_abaa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_f4c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_75d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_1c73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_ae0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_820a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_8627_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_7665_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_4561_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_1ce2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_163e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_8655_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_5c7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3c28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_1453_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_cd28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_e747_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ba1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6177_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_ce77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_c074_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2263_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b551_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_b3e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_c0e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_4897_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_6a29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_0457_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a167_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_0ea4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1e9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_2788_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6cbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_4b78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_10e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_488e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_d204_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_eb29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4b75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1cae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_5090_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_ab4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ed31_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_bfd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_fd68_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_d0fd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_a586] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_a586_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_de41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_db78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_de41_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_db78_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_bc73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output;

     -- opc_jci[uxn_opcodes_h_l1001_c39_a6cb] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output := opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_cb48] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_bc73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_a6cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_d63b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_b610] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_8938] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_b610_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_8938_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_254d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_972c] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_87b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_254d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_972c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_4cdc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_6ad4] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output := opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_6ec8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4cdc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_6ad4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_3c6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_3aea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_30af] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_3aea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_30af_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_673c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output;

     -- opc_litr[uxn_opcodes_h_l1006_c39_840a] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_840a_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output := opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_c2fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_673c_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_c2fe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_840a_return_output;
     -- opc_lit2r[uxn_opcodes_h_l1007_c39_dc14] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_e59a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_7d6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_7d6c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_dc14_return_output;
     -- opc_inc[uxn_opcodes_h_l1008_c39_048c] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_048c_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_048c_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output := opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_3fd3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_8689] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_8689_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_048c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_eda8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_233c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_8aa7] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_233c_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_eda8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_8aa7_return_output;
     -- opc_pop[uxn_opcodes_h_l1010_c39_4353] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_4353_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_4353_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output := opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_12cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_5405] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_5405_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_4353_return_output;
     -- opc_pop2[uxn_opcodes_h_l1011_c39_053c] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_053c_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_69d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_7522] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_7522_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_69d7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_053c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_8a15] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_da5c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_4df4] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_4df4_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output := opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_8a15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_4df4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_8d25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_9761] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output;

     -- opc_nip2[uxn_opcodes_h_l1013_c39_9f52] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_9761_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9f52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_be9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_94f5] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_94f5_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output := opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_5d87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_be9e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_94f5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_c5ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_701c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_f9f8] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_701c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f9f8_return_output;
     -- opc_rot[uxn_opcodes_h_l1016_c39_0376] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_0376_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_0376_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output := opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_382d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_073e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_073e_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_382d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_0376_return_output;
     -- opc_rot2[uxn_opcodes_h_l1017_c39_6c5e] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_e0da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_8f53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_e0da_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_6c5e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_525e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_409d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output;

     -- opc_dup[uxn_opcodes_h_l1018_c39_ae77] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_ae77_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output := opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_409d_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_525e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_ae77_return_output;
     -- opc_dup2[uxn_opcodes_h_l1019_c39_57ca] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_7741] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_d6fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_7741_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_d6fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_57ca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_74b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_3704] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_3756] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_3756_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_3704_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_3756_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_b7bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_5876] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_c38b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_b7bc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_5876_return_output;
     -- opc_equ[uxn_opcodes_h_l1022_c39_e9b2] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output := opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_4edf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_b9b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_4edf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_e9b2_return_output;
     -- opc_equ2[uxn_opcodes_h_l1023_c39_d625] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_d625_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_0dc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_13f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_0dc0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_d625_return_output;
     -- opc_neq[uxn_opcodes_h_l1024_c39_980e] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_980e_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_980e_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output := opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_e5fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_36ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_e5fd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_980e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_b74e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_4759] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_4759_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_8454] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_8454_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_4759_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_3ae1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output;

     -- opc_gth[uxn_opcodes_h_l1026_c39_2026] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_2026_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_2026_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output := opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_5904] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_5904_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_2026_return_output;
     -- opc_gth2[uxn_opcodes_h_l1027_c39_b007] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_b007_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_b9ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9895] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9895_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_b9ea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_b007_return_output;
     -- opc_lth[uxn_opcodes_h_l1028_c39_d91a] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_d91a_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output := opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_1455] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_e998] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e998_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_1455_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_d91a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_9b33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_c078] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_e637] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_e637_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_c078_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_e637_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_356d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_0db2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_a8a1] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_356d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_a8a1_return_output;
     -- opc_jmp2[uxn_opcodes_h_l1031_c39_3ebb] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_befa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_c100] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_c100_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_befa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_3ebb_return_output;
     -- opc_jcn[uxn_opcodes_h_l1032_c39_4e92] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_34d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_6e2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_6e2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_4e92_return_output;
     -- opc_jcn2[uxn_opcodes_h_l1033_c39_a0e0] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_687d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_f29e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_687d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_a0e0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_0442] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_96d2] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_b0c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_0442_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_96d2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_7e0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_7d7b] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_58e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7e0f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7d7b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_ea22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_2612] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_2612_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_2612_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output := opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_0a09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_ea22_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_2612_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_ea8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_f7e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output;

     -- opc_sth2[uxn_opcodes_h_l1037_c39_03da] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_03da_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ea8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_03da_return_output;
     -- opc_ldz[uxn_opcodes_h_l1038_c39_f8a6] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_44c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_19e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_19e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_f8a6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_e58a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_ed77] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_fd7d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_fd7d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_ed77_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_7ac1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_94d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_5c48] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_5c48_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output := opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_94d3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_5c48_return_output;
     -- opc_stz2[uxn_opcodes_h_l1041_c39_5652] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_5652_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_0851] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_e826] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_0851_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_e826_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_5652_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_7f47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_f0c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_c14f] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_7f47_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c14f_return_output;
     -- opc_ldr2[uxn_opcodes_h_l1043_c39_eea8] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_092d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_3f0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_092d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_eea8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_eb64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_0298] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_6ea7] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_ins;
     opc_str_uxn_opcodes_h_l1044_c39_6ea7_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output := opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0298_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_eb64_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_6ea7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_239e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_a992] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_a992_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_a992_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output := opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_c1a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_239e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_a992_return_output;
     -- opc_lda[uxn_opcodes_h_l1046_c39_17a8] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_17a8_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output := opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_a781] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_2f84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a781_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_17a8_return_output;
     -- opc_lda2[uxn_opcodes_h_l1047_c39_b95c] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_f1bd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_2d1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_2d1c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_b95c_return_output;
     -- opc_sta[uxn_opcodes_h_l1048_c39_44b5] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_44b5_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output := opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_de4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_96db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_96db_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_de4f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_44b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_ea6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_0db6] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_d569] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_d569_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_ea6b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_0db6_return_output;
     -- opc_dei[uxn_opcodes_h_l1050_c39_611b] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_611b_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_611b_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output := opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_7147] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_e835] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_7147_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_e835_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_611b_return_output;
     -- opc_dei2[uxn_opcodes_h_l1051_c39_fd54] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_72b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_b00b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_72b2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_fd54_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_fa5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output;

     -- opc_deo[uxn_opcodes_h_l1052_c39_cd09] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_cd09_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output := opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_49fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_fa5e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_cd09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_7670] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_ad8e] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_7224] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_7224_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_7670_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_ad8e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_0754] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_0c86] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_0c86_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_ins;
     opc_add_uxn_opcodes_h_l1054_c39_0c86_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output := opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_5194] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_5194_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_0754_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_0c86_return_output;
     -- opc_add2[uxn_opcodes_h_l1055_c39_5321] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_5321_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_5321_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output := opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_94b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_a254] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_a254_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_94b6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_5321_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_93e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_620d] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_620d_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_620d_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output := opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_5a45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_5a45_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_620d_return_output;
     -- opc_sub2[uxn_opcodes_h_l1057_c39_0c2e] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_3821] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_8f8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_3821_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0c2e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_1be9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output;

     -- opc_mul[uxn_opcodes_h_l1058_c39_8d6d] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output := opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_e40a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_1be9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_8d6d_return_output;
     -- opc_mul2[uxn_opcodes_h_l1059_c39_2d9f] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_e591] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_93e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_e591_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_93e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_2d9f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_8b0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_fec6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_0687] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_0687_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_ins;
     opc_div_uxn_opcodes_h_l1060_c39_0687_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_return_output := opc_div_uxn_opcodes_h_l1060_c39_0687_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_fec6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_0687_return_output;
     -- opc_div2[uxn_opcodes_h_l1061_c39_39a0] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_39a0_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output := opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_9bd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_7ecb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_9bd6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_39a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_e729] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_1680] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_1680_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_ins;
     opc_and_uxn_opcodes_h_l1062_c39_1680_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_return_output := opc_and_uxn_opcodes_h_l1062_c39_1680_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_df2a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_e729_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_df2a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_1680_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_a461] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_e13d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_bc5d] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output := opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_a461_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_bc5d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_d8d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_a767] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_f680] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_f680_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_f680_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output := opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_a767_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_d8d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_f680_return_output;
     -- opc_ora2[uxn_opcodes_h_l1065_c39_e651] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_e651_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_7091] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_f483] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_f483_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_7091_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_e651_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_7cf1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output;

     -- opc_eor[uxn_opcodes_h_l1066_c39_4a91] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_4a91_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output := opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_14e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_14e8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_4a91_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_843d] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_843d_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_cfe5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_394c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_394c_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cfe5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_843d_return_output;
     -- opc_sft[uxn_opcodes_h_l1068_c39_ca30] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_ca30_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output := opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_b081] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_b081_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_ca30_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_603b] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_603b_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_603b_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_394c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_394c_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output := result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_394c_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_7cf1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output := result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_7cf1_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_f483] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_f483_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output := result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_f483_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_a767] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_a767_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output := result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_a767_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_e13d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output := result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_e13d_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_e729] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_e729_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output := result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_e729_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_7ecb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output := result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_7ecb_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_8b0d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output := result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_8b0d_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_e591] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_e591_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output := result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_e591_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_e40a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output := result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_e40a_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_8f8a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output := result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_8f8a_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_93e1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output := result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_93e1_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_a254] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_a254_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output := result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_a254_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_5194] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_5194_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output := result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_5194_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_7224] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_7224_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output := result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_7224_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_49fb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output := result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_49fb_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_b00b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output := result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_b00b_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_7147] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_7147_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output := result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_7147_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_d569] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_d569_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output := result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_d569_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_96db] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_96db_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output := result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_96db_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_f1bd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output := result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_f1bd_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_2f84] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output := result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_2f84_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_c1a1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output := result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_c1a1_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_0298] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_0298_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output := result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_0298_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_3f0b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output := result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_3f0b_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_f0c0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output := result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_f0c0_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_0851] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_0851_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output := result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_0851_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_7ac1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output := result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_7ac1_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_e58a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output := result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_e58a_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_44c2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output := result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_44c2_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_f7e6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output := result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_f7e6_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_0a09] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output := result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_0a09_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_58e3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output := result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_58e3_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_b0c8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output := result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_b0c8_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_f29e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output := result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_f29e_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_34d6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output := result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_34d6_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_c100] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_c100_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output := result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_c100_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_0db2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output := result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_0db2_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_9b33] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output := result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_9b33_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_e998] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_e998_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output := result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_e998_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_9895] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_9895_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output := result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_9895_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_3ae1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output := result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_3ae1_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_b74e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output := result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_b74e_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_36ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output := result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ad_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_13f7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output := result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_13f7_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_b9b8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output := result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_b9b8_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_c38b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output := result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_c38b_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_74b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output := result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_74b6_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_7741] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_7741_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output := result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_7741_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_409d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_409d_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output := result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_409d_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_8f53] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output := result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_8f53_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_073e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_073e_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output := result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_073e_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_c5ce] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output := result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_c5ce_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_5d87] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output := result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_5d87_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_8d25] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output := result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_8d25_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_da5c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output := result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_da5c_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_7522] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_7522_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output := result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_7522_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_12cc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output := result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_12cc_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_233c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_233c_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output := result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_233c_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_3fd3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output := result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_3fd3_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_e59a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output := result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_e59a_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_673c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_673c_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output := result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_673c_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_3c6c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output := result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_3c6c_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_6ec8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output := result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_6ec8_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_87b3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output := result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_87b3_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_d63b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output := result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_d63b_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_cb48] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output := result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_cb48_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_de41] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_de41_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output := result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_de41_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_a586] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_a586_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output := result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_a586_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_ee2f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output := result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_ee2f_return_output;
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
