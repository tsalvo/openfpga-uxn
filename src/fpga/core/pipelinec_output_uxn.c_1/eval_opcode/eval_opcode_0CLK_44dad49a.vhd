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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_759b]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_d131]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_82e5]
signal result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_987d]
signal opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_e809]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_6d94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_92a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_d131]
signal result_MUX_uxn_opcodes_h_l1001_c7_d131_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_e545]
signal opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_3653]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_c596]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_a741]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_92a2]
signal result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_29ba]
signal opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_cf34]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3bd9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_e678]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_a741]
signal result_MUX_uxn_opcodes_h_l1003_c7_a741_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_d079]
signal opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_e599]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_1bc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_51d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_e678]
signal result_MUX_uxn_opcodes_h_l1004_c7_e678_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_85a4]
signal opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_94b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_1666]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_be9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_51d0]
signal result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_ea0e]
signal opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_aa59]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_674d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_7ff9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_be9b]
signal result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_c6a1]
signal opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_bb34]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_7a61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_744e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_7ff9]
signal result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_b7b2]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_1c07]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_b3d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_0e76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_744e]
signal result_MUX_uxn_opcodes_h_l1008_c7_744e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_eff5]
signal opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_eff5_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_f0bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_04ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_16af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_0e76]
signal result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_fdac]
signal opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_93a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_602c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_6718]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_16af]
signal result_MUX_uxn_opcodes_h_l1010_c7_16af_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_420e]
signal opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_420e_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_420e_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_b55b]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_0a00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_1a80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_6718]
signal result_MUX_uxn_opcodes_h_l1011_c7_6718_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_2bde]
signal opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_a3cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_59ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_3e64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_1a80]
signal result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_4fc0]
signal opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_c043]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_1ab2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_0b7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_3e64]
signal result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_088d]
signal opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_088d_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_61ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_6c5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_b851]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_0b7d]
signal result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_fbf2]
signal opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_2be6]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_d09e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_9607]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_b851]
signal result_MUX_uxn_opcodes_h_l1015_c7_b851_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_1f5d]
signal opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_92f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_29ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_ab90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_9607]
signal result_MUX_uxn_opcodes_h_l1016_c7_9607_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_f943]
signal opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_f943_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_f943_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_9126]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_8090]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_a964]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_ab90]
signal result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_7f13]
signal opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_57aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_347c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_c25c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_a964]
signal result_MUX_uxn_opcodes_h_l1018_c7_a964_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_4c17]
signal opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4c17_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f244]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_118d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_f836]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_c25c]
signal result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_d9cf]
signal opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_e4de]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_00c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_cd39]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_f836]
signal result_MUX_uxn_opcodes_h_l1020_c7_f836_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_fdd7]
signal opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_64a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_4330]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_74c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_cd39]
signal result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_568d]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_624e]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_d616]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_1d01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_74c1]
signal result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_df66]
signal opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_df66_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_df66_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_69f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_eb68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_dcb4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_1d01]
signal result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_074d]
signal opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_074d_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_ec27]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_461e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_62f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_dcb4]
signal result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_f77b]
signal opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_f77b_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_52fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_bd3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_36ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_62f9]
signal result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_6a88]
signal opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_d57f]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4ae4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9a4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_36ae]
signal result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_f606]
signal opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f606_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f606_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_b281]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_2bc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_bede]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_9a4c]
signal result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_4491]
signal opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_4491_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_b76e]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_1ca0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9df2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_bede]
signal result_MUX_uxn_opcodes_h_l1028_c7_bede_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_2531]
signal opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_2531_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_2531_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_0cac]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_37a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_3383]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_9df2]
signal result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_461a]
signal opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_461a_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_3c6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_09c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_ba47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_3383]
signal result_MUX_uxn_opcodes_h_l1030_c7_3383_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_4788]
signal opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_4788_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_1c67]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_62d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_f2f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_ba47]
signal result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_55a9]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_3366]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_2630]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_f3b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_f2f9]
signal result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_9939]
signal opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9939_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_db32]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_71ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_a6dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_f3b3]
signal result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_34f7]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_24ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_2908]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_9719]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_a6dd]
signal result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_e491]
signal opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e491_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_0fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_9685]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d31a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_9719]
signal result_MUX_uxn_opcodes_h_l1035_c7_9719_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_4af6]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_252d]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_7c69]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_9557]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_d31a]
signal result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_0983]
signal opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_0983_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_0983_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_52c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_2387]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_7964]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_9557]
signal result_MUX_uxn_opcodes_h_l1037_c7_9557_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_f93b]
signal opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_7298]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_af8a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_eada]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_7964]
signal result_MUX_uxn_opcodes_h_l1038_c7_7964_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_d997]
signal opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_d997_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_36bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_4e34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_256d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_eada]
signal result_MUX_uxn_opcodes_h_l1039_c7_eada_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_c55e]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_edad]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_9455]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_7859]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_256d]
signal result_MUX_uxn_opcodes_h_l1040_c7_256d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_22df]
signal opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_22df_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_22df_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_2ed0]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_b0cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_d3d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_7859]
signal result_MUX_uxn_opcodes_h_l1041_c7_7859_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_98cc]
signal opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_ad58]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_5d9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_199b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_d3d0]
signal result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_2706]
signal opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_2706_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_b6e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_97e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_58e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_199b]
signal result_MUX_uxn_opcodes_h_l1043_c7_199b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_980a]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_875c]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_1ae7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_6b32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_58e5]
signal result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_4ccd]
signal opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_4ccd_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_f17a]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_f268]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_9f02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_6b32]
signal result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_b5f6]
signal opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_6f59]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_fba8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_99ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_9f02]
signal result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_502f]
signal opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_502f_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_502f_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_ea52]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_f34e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_6486]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_99ed]
signal result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_7f9a]
signal opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_dd7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_446e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_5a33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_6486]
signal result_MUX_uxn_opcodes_h_l1048_c7_6486_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_690b]
signal opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_690b_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_690b_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_9cf0]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_26bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_ddf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_5a33]
signal result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_c8ed]
signal opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_3d24]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_010f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_4a85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_ddf0]
signal result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_6af4]
signal opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_6af4_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_1a90]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_3a85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_3d15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_4a85]
signal result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_c09f]
signal opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_dc60]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_a15b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_ecdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_3d15]
signal result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_97bd]
signal opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_97bd_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_390e]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_db4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_5624]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_ecdd]
signal result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_5b2c]
signal opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_a26f]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_cec2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_60a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_5624]
signal result_MUX_uxn_opcodes_h_l1054_c7_5624_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_950c]
signal opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_950c_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_950c_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_950c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_1c1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_8306]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_c8aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_60a1]
signal result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_50ab]
signal opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_50ab_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_1562]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_03cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_9518]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_c8aa]
signal result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_d899]
signal opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_d899_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_d899_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_4b97]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_1368]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_ccd6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_9518]
signal result_MUX_uxn_opcodes_h_l1057_c7_9518_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_8e59]
signal opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_7693]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_7896]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_8a14]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_ccd6]
signal result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_9ffd]
signal opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_dc8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_309e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_9ca1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_8a14]
signal result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_d86b]
signal opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_5cf5]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_a8c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_bbe4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_9ca1]
signal result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_219c]
signal opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_219c_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_219c_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_219c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_ec60]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_1806]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_2f92]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_bbe4]
signal result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_e107]
signal opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_e107_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_e107_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_007e]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_5647]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_d8c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_2f92]
signal result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_1d4a]
signal opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1d4a_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_77bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_fff5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_2b70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_d8c5]
signal result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_0165]
signal opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0165_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0165_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_91e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_716e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_25d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_2b70]
signal result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_9d19]
signal opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_9d19_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_fd6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_4acb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_726b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_25d7]
signal result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_fc59]
signal opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_2ff1]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_e9e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_c4fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_726b]
signal result_MUX_uxn_opcodes_h_l1066_c7_726b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_e2b7]
signal opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ee27]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_ece1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_be45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_c4fc]
signal result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_3876]
signal opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_3876_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_d5d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_7057]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_2d97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_be45]
signal result_MUX_uxn_opcodes_h_l1068_c7_be45_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_8344]
signal opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8344_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8344_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_8a6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_4854]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_2d97]
signal result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_685f]
signal opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_685f_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_82e5
result_MUX_uxn_opcodes_h_l1000_c2_82e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond,
result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_987d
opc_brk_uxn_opcodes_h_l1000_c34_987d : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_d131
result_MUX_uxn_opcodes_h_l1001_c7_d131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_d131_cond,
result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_e545
opc_jci_uxn_opcodes_h_l1001_c39_e545 : entity work.opc_jci_0CLK_4c4669f6 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_92a2
result_MUX_uxn_opcodes_h_l1002_c7_92a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond,
result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_29ba
opc_jmi_uxn_opcodes_h_l1002_c39_29ba : entity work.opc_jmi_0CLK_dd82b7a2 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_a741
result_MUX_uxn_opcodes_h_l1003_c7_a741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_a741_cond,
result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_d079
opc_jsi_uxn_opcodes_h_l1003_c39_d079 : entity work.opc_jsi_0CLK_0a77da6f port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_e678
result_MUX_uxn_opcodes_h_l1004_c7_e678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_e678_cond,
result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_85a4
opc_lit_uxn_opcodes_h_l1004_c39_85a4 : entity work.opc_lit_0CLK_fb192e55 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins,
opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_51d0
result_MUX_uxn_opcodes_h_l1005_c7_51d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond,
result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_ea0e
opc_lit2_uxn_opcodes_h_l1005_c39_ea0e : entity work.opc_lit2_0CLK_3aa2ab20 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_be9b
result_MUX_uxn_opcodes_h_l1006_c7_be9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond,
result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_c6a1
opc_litr_uxn_opcodes_h_l1006_c39_c6a1 : entity work.opc_litr_0CLK_fb192e55 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins,
opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_7ff9
result_MUX_uxn_opcodes_h_l1007_c7_7ff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond,
result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2
opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2 : entity work.opc_lit2r_0CLK_3aa2ab20 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_744e
result_MUX_uxn_opcodes_h_l1008_c7_744e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_744e_cond,
result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_eff5
opc_inc_uxn_opcodes_h_l1008_c39_eff5 : entity work.opc_inc_0CLK_d6df7042 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins,
opc_inc_uxn_opcodes_h_l1008_c39_eff5_k,
opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_0e76
result_MUX_uxn_opcodes_h_l1009_c7_0e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond,
result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_fdac
opc_inc2_uxn_opcodes_h_l1009_c39_fdac : entity work.opc_inc2_0CLK_ab649236 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k,
opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_16af
result_MUX_uxn_opcodes_h_l1010_c7_16af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_16af_cond,
result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_420e
opc_pop_uxn_opcodes_h_l1010_c39_420e : entity work.opc_pop_0CLK_dffed988 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_420e_ins,
opc_pop_uxn_opcodes_h_l1010_c39_420e_k,
opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_6718
result_MUX_uxn_opcodes_h_l1011_c7_6718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_6718_cond,
result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_2bde
opc_pop2_uxn_opcodes_h_l1011_c39_2bde : entity work.opc_pop2_0CLK_dffed988 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k,
opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_1a80
result_MUX_uxn_opcodes_h_l1012_c7_1a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond,
result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_4fc0
opc_nip_uxn_opcodes_h_l1012_c39_4fc0 : entity work.opc_nip_0CLK_eee12f66 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins,
opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k,
opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_3e64
result_MUX_uxn_opcodes_h_l1013_c7_3e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond,
result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_088d
opc_nip2_uxn_opcodes_h_l1013_c39_088d : entity work.opc_nip2_0CLK_595bc5ba port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_088d_k,
opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_0b7d
result_MUX_uxn_opcodes_h_l1014_c7_0b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond,
result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_fbf2
opc_swp_uxn_opcodes_h_l1014_c39_fbf2 : entity work.opc_swp_0CLK_8b182ca9 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins,
opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k,
opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_b851
result_MUX_uxn_opcodes_h_l1015_c7_b851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_b851_cond,
result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_1f5d
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d : entity work.opc_swp2_0CLK_1cf85e9c port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k,
opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_9607
result_MUX_uxn_opcodes_h_l1016_c7_9607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_9607_cond,
result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_f943
opc_rot_uxn_opcodes_h_l1016_c39_f943 : entity work.opc_rot_0CLK_4850ef50 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_f943_ins,
opc_rot_uxn_opcodes_h_l1016_c39_f943_k,
opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_ab90
result_MUX_uxn_opcodes_h_l1017_c7_ab90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond,
result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_7f13
opc_rot2_uxn_opcodes_h_l1017_c39_7f13 : entity work.opc_rot2_0CLK_49c1023c port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k,
opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_a964
result_MUX_uxn_opcodes_h_l1018_c7_a964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_a964_cond,
result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_4c17
opc_dup_uxn_opcodes_h_l1018_c39_4c17 : entity work.opc_dup_0CLK_dd62d56e port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins,
opc_dup_uxn_opcodes_h_l1018_c39_4c17_k,
opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_c25c
result_MUX_uxn_opcodes_h_l1019_c7_c25c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond,
result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_d9cf
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf : entity work.opc_dup2_0CLK_c8878770 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k,
opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_f836
result_MUX_uxn_opcodes_h_l1020_c7_f836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_f836_cond,
result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_fdd7
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7 : entity work.opc_ovr_0CLK_09d9764c port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k,
opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_cd39
result_MUX_uxn_opcodes_h_l1021_c7_cd39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond,
result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_568d
opc_ovr2_uxn_opcodes_h_l1021_c39_568d : entity work.opc_ovr2_0CLK_3d799363 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_74c1
result_MUX_uxn_opcodes_h_l1022_c7_74c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond,
result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_df66
opc_equ_uxn_opcodes_h_l1022_c39_df66 : entity work.opc_equ_0CLK_4bcf4f80 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_df66_ins,
opc_equ_uxn_opcodes_h_l1022_c39_df66_k,
opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_1d01
result_MUX_uxn_opcodes_h_l1023_c7_1d01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond,
result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_074d
opc_equ2_uxn_opcodes_h_l1023_c39_074d : entity work.opc_equ2_0CLK_aa0f47c3 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_074d_k,
opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_dcb4
result_MUX_uxn_opcodes_h_l1024_c7_dcb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond,
result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_f77b
opc_neq_uxn_opcodes_h_l1024_c39_f77b : entity work.opc_neq_0CLK_4bcf4f80 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins,
opc_neq_uxn_opcodes_h_l1024_c39_f77b_k,
opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_62f9
result_MUX_uxn_opcodes_h_l1025_c7_62f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond,
result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_6a88
opc_neq2_uxn_opcodes_h_l1025_c39_6a88 : entity work.opc_neq2_0CLK_aa0f47c3 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k,
opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_36ae
result_MUX_uxn_opcodes_h_l1026_c7_36ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond,
result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_f606
opc_gth_uxn_opcodes_h_l1026_c39_f606 : entity work.opc_gth_0CLK_4bcf4f80 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_f606_ins,
opc_gth_uxn_opcodes_h_l1026_c39_f606_k,
opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_9a4c
result_MUX_uxn_opcodes_h_l1027_c7_9a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond,
result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_4491
opc_gth2_uxn_opcodes_h_l1027_c39_4491 : entity work.opc_gth2_0CLK_aa0f47c3 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_4491_k,
opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_bede
result_MUX_uxn_opcodes_h_l1028_c7_bede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_bede_cond,
result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_2531
opc_lth_uxn_opcodes_h_l1028_c39_2531 : entity work.opc_lth_0CLK_4bcf4f80 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_2531_ins,
opc_lth_uxn_opcodes_h_l1028_c39_2531_k,
opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_9df2
result_MUX_uxn_opcodes_h_l1029_c7_9df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond,
result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_461a
opc_lth2_uxn_opcodes_h_l1029_c39_461a : entity work.opc_lth2_0CLK_aa0f47c3 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_461a_k,
opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_3383
result_MUX_uxn_opcodes_h_l1030_c7_3383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_3383_cond,
result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_4788
opc_jmp_uxn_opcodes_h_l1030_c39_4788 : entity work.opc_jmp_0CLK_ab8f8397 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_4788_k,
opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_ba47
result_MUX_uxn_opcodes_h_l1031_c7_ba47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond,
result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_55a9
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9 : entity work.opc_jmp2_0CLK_cd0ff700 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_f2f9
result_MUX_uxn_opcodes_h_l1032_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond,
result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_9939
opc_jcn_uxn_opcodes_h_l1032_c39_9939 : entity work.opc_jcn_0CLK_7f8adde9 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_9939_k,
opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_f3b3
result_MUX_uxn_opcodes_h_l1033_c7_f3b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond,
result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_34f7
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7 : entity work.opc_jcn2_0CLK_fc8f03ff port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_a6dd
result_MUX_uxn_opcodes_h_l1034_c7_a6dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond,
result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_e491
opc_jsr_uxn_opcodes_h_l1034_c39_e491 : entity work.opc_jsr_0CLK_1d648d8a port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_e491_k,
opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_9719
result_MUX_uxn_opcodes_h_l1035_c7_9719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_9719_cond,
result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_4af6
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6 : entity work.opc_jsr2_0CLK_421159e4 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_d31a
result_MUX_uxn_opcodes_h_l1036_c7_d31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond,
result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_0983
opc_sth_uxn_opcodes_h_l1036_c39_0983 : entity work.opc_sth_0CLK_3ec49a15 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_0983_ins,
opc_sth_uxn_opcodes_h_l1036_c39_0983_k,
opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_9557
result_MUX_uxn_opcodes_h_l1037_c7_9557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_9557_cond,
result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_f93b
opc_sth2_uxn_opcodes_h_l1037_c39_f93b : entity work.opc_sth2_0CLK_186906f2 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k,
opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_7964
result_MUX_uxn_opcodes_h_l1038_c7_7964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_7964_cond,
result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_d997
opc_ldz_uxn_opcodes_h_l1038_c39_d997 : entity work.opc_ldz_0CLK_7041f0d4 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_d997_k,
opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_eada
result_MUX_uxn_opcodes_h_l1039_c7_eada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_eada_cond,
result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_c55e
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e : entity work.opc_ldz2_0CLK_7c39c135 port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_256d
result_MUX_uxn_opcodes_h_l1040_c7_256d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_256d_cond,
result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_22df
opc_stz_uxn_opcodes_h_l1040_c39_22df : entity work.opc_stz_0CLK_b96dbee9 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_22df_ins,
opc_stz_uxn_opcodes_h_l1040_c39_22df_k,
opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_7859
result_MUX_uxn_opcodes_h_l1041_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_7859_cond,
result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_98cc
opc_stz2_uxn_opcodes_h_l1041_c39_98cc : entity work.opc_stz2_0CLK_4d96a8bf port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k,
opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_d3d0
result_MUX_uxn_opcodes_h_l1042_c7_d3d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond,
result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_2706
opc_ldr_uxn_opcodes_h_l1042_c39_2706 : entity work.opc_ldr_0CLK_82f21321 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_2706_k,
opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_199b
result_MUX_uxn_opcodes_h_l1043_c7_199b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_199b_cond,
result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_980a
opc_ldr2_uxn_opcodes_h_l1043_c39_980a : entity work.opc_ldr2_0CLK_70d4381b port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_58e5
result_MUX_uxn_opcodes_h_l1044_c7_58e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond,
result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_4ccd
opc_str_uxn_opcodes_h_l1044_c39_4ccd : entity work.opc_str_0CLK_312a4701 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins,
opc_str_uxn_opcodes_h_l1044_c39_4ccd_k,
opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_6b32
result_MUX_uxn_opcodes_h_l1045_c7_6b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond,
result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_b5f6
opc_str2_uxn_opcodes_h_l1045_c39_b5f6 : entity work.opc_str2_0CLK_9c90a87c port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins,
opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k,
opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_9f02
result_MUX_uxn_opcodes_h_l1046_c7_9f02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond,
result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_502f
opc_lda_uxn_opcodes_h_l1046_c39_502f : entity work.opc_lda_0CLK_bb6fd9ae port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_502f_ins,
opc_lda_uxn_opcodes_h_l1046_c39_502f_k,
opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_99ed
result_MUX_uxn_opcodes_h_l1047_c7_99ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond,
result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_7f9a
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a : entity work.opc_lda2_0CLK_92ff38d5 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k,
opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_6486
result_MUX_uxn_opcodes_h_l1048_c7_6486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_6486_cond,
result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_690b
opc_sta_uxn_opcodes_h_l1048_c39_690b : entity work.opc_sta_0CLK_9debfd4d port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_690b_ins,
opc_sta_uxn_opcodes_h_l1048_c39_690b_k,
opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_5a33
result_MUX_uxn_opcodes_h_l1049_c7_5a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond,
result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_c8ed
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed : entity work.opc_sta2_0CLK_5153798f port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k,
opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_ddf0
result_MUX_uxn_opcodes_h_l1050_c7_ddf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond,
result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_6af4
opc_dei_uxn_opcodes_h_l1050_c39_6af4 : entity work.opc_dei_0CLK_4cadf5f3 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins,
opc_dei_uxn_opcodes_h_l1050_c39_6af4_k,
opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_4a85
result_MUX_uxn_opcodes_h_l1051_c7_4a85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond,
result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_c09f
opc_dei2_uxn_opcodes_h_l1051_c39_c09f : entity work.opc_dei2_0CLK_1a8244c2 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k,
opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_3d15
result_MUX_uxn_opcodes_h_l1052_c7_3d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond,
result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_97bd
opc_deo_uxn_opcodes_h_l1052_c39_97bd : entity work.opc_deo_0CLK_434848af port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins,
opc_deo_uxn_opcodes_h_l1052_c39_97bd_k,
opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_ecdd
result_MUX_uxn_opcodes_h_l1053_c7_ecdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond,
result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_5b2c
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c : entity work.opc_deo2_0CLK_d7508b32 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k,
opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_5624
result_MUX_uxn_opcodes_h_l1054_c7_5624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_5624_cond,
result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_950c
opc_add_uxn_opcodes_h_l1054_c39_950c : entity work.opc_add_0CLK_fec2727b port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_950c_ins,
opc_add_uxn_opcodes_h_l1054_c39_950c_k,
opc_add_uxn_opcodes_h_l1054_c39_950c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_60a1
result_MUX_uxn_opcodes_h_l1055_c7_60a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond,
result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_50ab
opc_add2_uxn_opcodes_h_l1055_c39_50ab : entity work.opc_add2_0CLK_3ec85585 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins,
opc_add2_uxn_opcodes_h_l1055_c39_50ab_k,
opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_c8aa
result_MUX_uxn_opcodes_h_l1056_c7_c8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond,
result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_d899
opc_sub_uxn_opcodes_h_l1056_c39_d899 : entity work.opc_sub_0CLK_fec2727b port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_d899_ins,
opc_sub_uxn_opcodes_h_l1056_c39_d899_k,
opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_9518
result_MUX_uxn_opcodes_h_l1057_c7_9518 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_9518_cond,
result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_8e59
opc_sub2_uxn_opcodes_h_l1057_c39_8e59 : entity work.opc_sub2_0CLK_3ec85585 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k,
opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_ccd6
result_MUX_uxn_opcodes_h_l1058_c7_ccd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond,
result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_9ffd
opc_mul_uxn_opcodes_h_l1058_c39_9ffd : entity work.opc_mul_0CLK_fec2727b port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins,
opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k,
opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_8a14
result_MUX_uxn_opcodes_h_l1059_c7_8a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond,
result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_d86b
opc_mul2_uxn_opcodes_h_l1059_c39_d86b : entity work.opc_mul2_0CLK_3ec85585 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k,
opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_9ca1
result_MUX_uxn_opcodes_h_l1060_c7_9ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond,
result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_219c
opc_div_uxn_opcodes_h_l1060_c39_219c : entity work.opc_div_0CLK_eff7b951 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_219c_ins,
opc_div_uxn_opcodes_h_l1060_c39_219c_k,
opc_div_uxn_opcodes_h_l1060_c39_219c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_bbe4
result_MUX_uxn_opcodes_h_l1061_c7_bbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond,
result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_e107
opc_div2_uxn_opcodes_h_l1061_c39_e107 : entity work.opc_div2_0CLK_e1a1d759 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_e107_ins,
opc_div2_uxn_opcodes_h_l1061_c39_e107_k,
opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_2f92
result_MUX_uxn_opcodes_h_l1062_c7_2f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond,
result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_1d4a
opc_and_uxn_opcodes_h_l1062_c39_1d4a : entity work.opc_and_0CLK_fec2727b port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins,
opc_and_uxn_opcodes_h_l1062_c39_1d4a_k,
opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_d8c5
result_MUX_uxn_opcodes_h_l1063_c7_d8c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond,
result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_0165
opc_and2_uxn_opcodes_h_l1063_c39_0165 : entity work.opc_and2_0CLK_3ec85585 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_0165_ins,
opc_and2_uxn_opcodes_h_l1063_c39_0165_k,
opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_2b70
result_MUX_uxn_opcodes_h_l1064_c7_2b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond,
result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_9d19
opc_ora_uxn_opcodes_h_l1064_c39_9d19 : entity work.opc_ora_0CLK_fec2727b port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins,
opc_ora_uxn_opcodes_h_l1064_c39_9d19_k,
opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_25d7
result_MUX_uxn_opcodes_h_l1065_c7_25d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond,
result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_fc59
opc_ora2_uxn_opcodes_h_l1065_c39_fc59 : entity work.opc_ora2_0CLK_3ec85585 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k,
opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_726b
result_MUX_uxn_opcodes_h_l1066_c7_726b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_726b_cond,
result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_e2b7
opc_eor_uxn_opcodes_h_l1066_c39_e2b7 : entity work.opc_eor_0CLK_fec2727b port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins,
opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k,
opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_c4fc
result_MUX_uxn_opcodes_h_l1067_c7_c4fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond,
result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_3876
opc_eor2_uxn_opcodes_h_l1067_c39_3876 : entity work.opc_eor2_0CLK_3ec85585 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_3876_k,
opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_be45
result_MUX_uxn_opcodes_h_l1068_c7_be45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_be45_cond,
result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_8344
opc_sft_uxn_opcodes_h_l1068_c39_8344 : entity work.opc_sft_0CLK_db76791a port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_8344_ins,
opc_sft_uxn_opcodes_h_l1068_c39_8344_k,
opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_2d97
result_MUX_uxn_opcodes_h_l1069_c7_2d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond,
result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_685f
opc_sft2_uxn_opcodes_h_l1069_c39_685f : entity work.opc_sft2_0CLK_effe98ec port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_685f_k,
opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_950c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_219c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output : unsigned(0 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right := to_unsigned(255, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right := to_unsigned(252, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right := to_unsigned(49, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right := to_unsigned(253, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right := to_unsigned(38, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right := to_unsigned(26, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right := to_unsigned(249, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right := to_unsigned(47, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right := to_unsigned(251, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right := to_unsigned(34, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right := to_unsigned(254, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right := to_unsigned(44, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right := to_unsigned(250, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right := to_unsigned(22, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right := to_unsigned(30, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_dc60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_64a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_ec27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_b76e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_3d24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_0fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_5cf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_a3cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_fd6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_759b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_1c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_4b97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_57aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_007e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_bb34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_92f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_c043] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_9126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_f0bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_2be6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_f17a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_52fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_987d] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output := opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_ad58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_cf34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_a26f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_b55b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_8a6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_3c6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_2ff1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_db32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_9cf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_aa59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_1562] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_edad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_36bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_94b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_52c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_3366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_77bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_252d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_ec60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_61ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_875c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_6f59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_ea52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_7693] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_69f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_b281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_dc8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_d5d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ee27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_0cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_1c07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_91e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_24ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_390e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_624e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_d57f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_1c1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_7298] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_e809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_2ed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_93a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_b6e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_e4de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_3653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_dd7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_e599] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_1a90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_759b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_e809_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_3653_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_cf34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_e599_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_94b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_aa59_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_bb34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_1c07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f0bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_93a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b55b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_a3cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c043_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_61ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_2be6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_92f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_9126_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_57aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f244_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_e4de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_64a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_624e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_69f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_ec27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_52fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_d57f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_b281_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_b76e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0cac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_3c6a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_1c67_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_3366_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_db32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_24ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0fb0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_252d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_52c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_7298_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_36bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_edad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_2ed0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_ad58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_b6e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_875c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_f17a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6f59_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_ea52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_dd7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_9cf0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_3d24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_1a90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_dc60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_390e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_a26f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_1c1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_1562_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_4b97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_7693_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_dc8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_5cf5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_ec60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_007e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_77bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_91e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_fd6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_2ff1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ee27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_d5d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_8a6a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_987d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_d131] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_d131_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_92a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_6d94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6d94_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_a741] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output;

     -- opc_jci[uxn_opcodes_h_l1001_c39_e545] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output := opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_c596] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_a741_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_c596_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_e545_return_output;
     -- opc_jmi[uxn_opcodes_h_l1002_c39_29ba] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3bd9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_e678] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_e678_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3bd9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_29ba_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_1bc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_d079] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_51d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1bc5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_d079_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_1666] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_85a4] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output := opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_be9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_1666_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_85a4_return_output;
     -- opc_lit2[uxn_opcodes_h_l1005_c39_ea0e] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_7ff9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_674d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_674d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_ea0e_return_output;
     -- opc_litr[uxn_opcodes_h_l1006_c39_c6a1] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output := opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_744e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_7a61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_744e_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_7a61_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_c6a1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_0e76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_b3d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_b7b2] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_b3d7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_b7b2_return_output;
     -- opc_inc[uxn_opcodes_h_l1008_c39_eff5] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_eff5_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output := opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_04ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_16af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_16af_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_04ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_eff5_return_output;
     -- opc_inc2[uxn_opcodes_h_l1009_c39_fdac] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_602c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_6718] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_6718_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_602c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_fdac_return_output;
     -- opc_pop[uxn_opcodes_h_l1010_c39_420e] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_420e_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_420e_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output := opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_1a80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_0a00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_0a00_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_420e_return_output;
     -- opc_pop2[uxn_opcodes_h_l1011_c39_2bde] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_59ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_3e64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_59ff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_2bde_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_1ab2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_4fc0] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output := opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_0b7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_1ab2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_4fc0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_b851] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output;

     -- opc_nip2[uxn_opcodes_h_l1013_c39_088d] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_088d_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_6c5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_b851_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_6c5d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_088d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_9607] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_fbf2] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output := opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_d09e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_9607_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_d09e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_fbf2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_ab90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_1f5d] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_29ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_29ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_1f5d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_a964] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_8090] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_f943] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_f943_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_f943_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output := opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a964_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_8090_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_f943_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_347c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_c25c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_7f13] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_347c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_7f13_return_output;
     -- opc_dup[uxn_opcodes_h_l1018_c39_4c17] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_4c17_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output := opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_f836] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_118d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_f836_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_118d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_4c17_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_00c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_cd39] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_d9cf] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_00c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_d9cf_return_output;
     -- opc_ovr[uxn_opcodes_h_l1020_c39_fdd7] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_74c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_4330] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_4330_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_fdd7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_1d01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_d616] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_568d] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_d616_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_568d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_dcb4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_eb68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_df66] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_df66_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_df66_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output := opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_eb68_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_df66_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_62f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_461e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output;

     -- opc_equ2[uxn_opcodes_h_l1023_c39_074d] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_074d_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_461e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_074d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_bd3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_f77b] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_f77b_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output := opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_36ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_bd3c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_f77b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4ae4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_6a88] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9a4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4ae4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_6a88_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_2bc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_bede] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output;

     -- opc_gth[uxn_opcodes_h_l1026_c39_f606] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_f606_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_f606_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output := opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bede_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_2bc0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_f606_return_output;
     -- opc_gth2[uxn_opcodes_h_l1027_c39_4491] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_4491_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_1ca0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_9df2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_1ca0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_4491_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_3383] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_37a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_2531] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_2531_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_2531_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output := opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_3383_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_37a4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_2531_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_09c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_461a] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_461a_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_ba47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_09c1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_461a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_62d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_4788] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_4788_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_f2f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_62d2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_4788_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_f3b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_2630] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_55a9] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_2630_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_55a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_71ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_9939] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_9939_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_a6dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_71ed_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9939_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_2908] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_9719] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_34f7] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_9719_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_2908_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_34f7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_d31a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_e491] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_e491_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_9685] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_9685_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e491_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_7c69] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_4af6] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_9557] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_9557_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_7c69_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_4af6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_7964] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_0983] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_0983_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_0983_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output := opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_2387] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_7964_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_2387_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_0983_return_output;
     -- opc_sth2[uxn_opcodes_h_l1037_c39_f93b] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_eada] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_af8a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_eada_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_af8a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_f93b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_256d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output;

     -- opc_ldz[uxn_opcodes_h_l1038_c39_d997] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_d997_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_4e34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_256d_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_4e34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_d997_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_9455] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_c55e] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_7859] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7859_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_9455_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_c55e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_d3d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_b0cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_22df] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_22df_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_22df_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output := opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_b0cb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_22df_return_output;
     -- opc_stz2[uxn_opcodes_h_l1041_c39_98cc] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_5d9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_199b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_199b_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_5d9d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_98cc_return_output;
     -- opc_ldr[uxn_opcodes_h_l1042_c39_2706] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_2706_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_58e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_97e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_97e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_2706_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_1ae7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_980a] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_6b32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_1ae7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_980a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_f268] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_9f02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_4ccd] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_ins;
     opc_str_uxn_opcodes_h_l1044_c39_4ccd_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output := opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_f268_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_4ccd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_fba8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_99ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_b5f6] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output := opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_fba8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_b5f6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_f34e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_6486] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_502f] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_502f_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_502f_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output := opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_6486_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_f34e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_502f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_5a33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output;

     -- opc_lda2[uxn_opcodes_h_l1047_c39_7f9a] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_446e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_446e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_7f9a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_26bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_ddf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_690b] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_690b_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_690b_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output := opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_26bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_690b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_4a85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_c8ed] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_010f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_010f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c8ed_return_output;
     -- opc_dei[uxn_opcodes_h_l1050_c39_6af4] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_6af4_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output := opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_3d15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_3a85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_3a85_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_6af4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_ecdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_a15b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_c09f] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a15b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_c09f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_5624] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output;

     -- opc_deo[uxn_opcodes_h_l1052_c39_97bd] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_97bd_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output := opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_db4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_5624_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_db4b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_97bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_60a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_cec2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_5b2c] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_cec2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_5b2c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_8306] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_950c] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_950c_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_ins;
     opc_add_uxn_opcodes_h_l1054_c39_950c_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_return_output := opc_add_uxn_opcodes_h_l1054_c39_950c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_c8aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_8306_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_950c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_03cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_50ab] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_50ab_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output := opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_9518] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_9518_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_03cb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_50ab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_ccd6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_d899] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_d899_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_d899_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output := opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_1368] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_1368_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_d899_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_7896] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output;

     -- opc_sub2[uxn_opcodes_h_l1057_c39_8e59] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_8a14] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_7896_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_8e59_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_309e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output;

     -- opc_mul[uxn_opcodes_h_l1058_c39_9ffd] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output := opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_9ca1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_309e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_9ffd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_a8c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_bbe4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_d86b] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_a8c5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_d86b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_2f92] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_219c] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_219c_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_ins;
     opc_div_uxn_opcodes_h_l1060_c39_219c_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_return_output := opc_div_uxn_opcodes_h_l1060_c39_219c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_1806] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_1806_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_219c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_5647] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_e107] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_e107_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_e107_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output := opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_d8c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_5647_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_e107_return_output;
     -- opc_and[uxn_opcodes_h_l1062_c39_1d4a] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_ins;
     opc_and_uxn_opcodes_h_l1062_c39_1d4a_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output := opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_fff5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_2b70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_fff5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_1d4a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_25d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_0165] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_0165_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_0165_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output := opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_716e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_716e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_0165_return_output;
     -- opc_ora[uxn_opcodes_h_l1064_c39_9d19] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_9d19_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output := opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_726b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_4acb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_726b_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_4acb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_9d19_return_output;
     -- opc_ora2[uxn_opcodes_h_l1065_c39_fc59] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_c4fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_e9e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_e9e1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_fc59_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_be45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_ece1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output;

     -- opc_eor[uxn_opcodes_h_l1066_c39_e2b7] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output := opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_be45_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_ece1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_e2b7_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_3876] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_3876_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_7057] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_2d97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_7057_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_3876_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_4854] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output;

     -- opc_sft[uxn_opcodes_h_l1068_c39_8344] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_8344_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_8344_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output := opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_4854_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_8344_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_685f] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_685f_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_685f_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_2d97] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output := result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_2d97_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_be45] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_be45_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output := result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_be45_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_c4fc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output := result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_c4fc_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_726b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_726b_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output := result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_726b_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_25d7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output := result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_25d7_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_2b70] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output := result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_2b70_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_d8c5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output := result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_d8c5_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_2f92] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output := result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_2f92_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_bbe4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output := result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_bbe4_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_9ca1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output := result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_9ca1_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_8a14] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output := result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_8a14_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_ccd6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output := result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_ccd6_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_9518] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_9518_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output := result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_9518_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_c8aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output := result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_c8aa_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_60a1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output := result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_60a1_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_5624] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_5624_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output := result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_5624_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_ecdd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output := result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_ecdd_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_3d15] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output := result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_3d15_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_4a85] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output := result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_4a85_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_ddf0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output := result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_ddf0_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_5a33] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output := result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_5a33_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_6486] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_6486_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output := result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_6486_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_99ed] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output := result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_99ed_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_9f02] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output := result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_9f02_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_6b32] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output := result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_6b32_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_58e5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output := result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_58e5_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_199b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_199b_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output := result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_199b_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_d3d0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output := result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_d3d0_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_7859] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_7859_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output := result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_7859_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_256d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_256d_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output := result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_256d_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_eada] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_eada_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output := result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_eada_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_7964] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_7964_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output := result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_7964_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_9557] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_9557_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output := result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_9557_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_d31a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output := result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_d31a_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_9719] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_9719_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output := result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_9719_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_a6dd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output := result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_a6dd_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_f3b3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output := result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_f3b3_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_f2f9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output := result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_f2f9_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_ba47] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output := result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_ba47_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_3383] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_3383_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output := result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_3383_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_9df2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output := result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_9df2_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_bede] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_bede_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output := result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_bede_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_9a4c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output := result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a4c_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_36ae] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output := result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_36ae_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_62f9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output := result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_62f9_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_dcb4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output := result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_dcb4_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_1d01] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output := result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_1d01_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_74c1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output := result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_74c1_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_cd39] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output := result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_cd39_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_f836] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_f836_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output := result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_f836_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_c25c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output := result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_c25c_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_a964] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_a964_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output := result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_a964_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_ab90] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output := result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_ab90_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_9607] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_9607_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output := result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_9607_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_b851] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_b851_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output := result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_b851_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_0b7d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output := result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_0b7d_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_3e64] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output := result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_3e64_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_1a80] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output := result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_1a80_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_6718] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_6718_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output := result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_6718_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_16af] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_16af_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output := result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_16af_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_0e76] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output := result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_0e76_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_744e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_744e_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output := result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_744e_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_7ff9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output := result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_7ff9_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_be9b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output := result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_be9b_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_51d0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output := result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_51d0_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_e678] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_e678_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output := result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_e678_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_a741] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_a741_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output := result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_a741_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_92a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output := result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_92a2_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_d131] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_d131_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output := result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_d131_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_82e5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output := result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_82e5_return_output;
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
